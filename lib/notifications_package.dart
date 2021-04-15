import 'dart:async';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/package/package.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';
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
  bool? state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS = null;

  static EliudQuery getOpenNotificationsQuery(String? appId, String? assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
          EliudQueryCondition('status', isEqualTo: NotificationStatus.Open.index)
        ]
    );
  }

  void _setState(bool newState, {MemberModel? currentMember}) {
    if (newState != state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS) {
      state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS = newState;
      accessBloc!.add(MemberUpdated(currentMember));
    }
  }

  void resubscribe(AppModel app, MemberModel? currentMember) {
    String? appId = app.documentID;
    if (currentMember != null) {
      subscription = notificationRepository(appId: appId)!.listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        _setState(list.length > 0, currentMember: currentMember);
      }, /*orderBy: 'timestamp',
          descending: true,
         */ eliudQuery: getOpenNotificationsQuery(
              appId, currentMember.documentID));
    } else {
      _setState(false);
    }
  }

  void unsubscribe() {
    super.unsubscribe();
    _setState(false);
  }

  @override
  Future<bool?> isConditionOk(String pluginCondition, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) async {
    if (pluginCondition == CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS) {
      if (state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS == null) return false;
      return state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS;
/*
      if (member == null) return false;
      var values = await notificationRepository(appId: app.documentID).valuesList(eliudQuery: getOpenNotificationsQuery(app.documentID, member.documentID));
      return values != null && values.length > 0;
*/
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

    // initialise the repository
    AbstractRepositorySingleton.singleton = RepositorySingleton();

    // initialise the platform
    AbstractNotificationPlatform.platform = NotificationPlatform();

  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;
}
