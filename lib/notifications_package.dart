import 'dart:async';
import 'package:eliud_core/model/access_model.dart';

import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_notifications/platform/platform.dart';
import 'package:eliud_core/package/package_with_subscription.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/notification_model.dart';

abstract class NotificationsPackage extends PackageWithSubscription {
  static final String CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS = 'Unread Notifications';
  bool previousState = null;

  static EliudQuery getOpenNotificationsQuery(String appId, String assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
          EliudQueryCondition('status', isEqualTo: NotificationStatus.Open.index)
        ]
    );
  }

  void resubscribe(AppModel app, MemberModel currentMember) {
    String appId = app.documentID;
    subscription = notificationRepository(appId: appId).listen((list) {
      // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
      // then we must inform the AccessBloc, so that it can refresh the state
      bool currentState = list.length > 0;
      if (currentState != previousState) {
        previousState = currentState;
        accessBloc.add(MemberUpdated(currentMember));
      }
    }, orderBy: 'timestamp', descending: true, eliudQuery: getOpenNotificationsQuery(appId, currentMember.documentID));
  }


  @override
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner, bool isBlocked, PrivilegeLevel privilegeLevel) async {
    if (pluginCondition == CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS) {
      if (member == null) return false;
      var values = await notificationRepository(appId: app.documentID).valuesList(eliudQuery: getOpenNotificationsQuery(app.documentID, member.documentID));
      return values != null && values.length > 0;
    }
    return null;
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [ CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS ];
  }

 @override
  void init() {
    ComponentRegistry().init();
    AbstractNotificationPlatform.platform = NotificationPlatform();
  }
}
