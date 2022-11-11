import 'dart:async';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_notifications/wizards/notification_dashboard_dialog_wizard.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_notifications/platform/platform.dart';
import 'model/component_registry.dart';
import 'model/notification_model.dart';

import 'package:eliud_pkg_notifications/notifications_package_stub.dart'
if (dart.library.io) 'notifications_mobile_package.dart'
if (dart.library.html) 'notifications_web_package.dart';

abstract class NotificationsPackage extends Package {
  NotificationsPackage() : super('eliud_pkg_notifications');
  
  static final String CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS = 'Unread Notifications';
  Map<String, bool?> state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS = {};
  Map<String, StreamSubscription<List<NotificationModel?>>> subscription = {};

  static EliudQuery getOpenNotificationsQuery(String? appId, String? assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
          EliudQueryCondition('status', isEqualTo: NotificationStatus.Open.index)
        ]
    );
  }



  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
      AccessBloc accessBloc,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) {
    var appId = app.documentID;
    subscription[appId]?.cancel();
    if (member != null) {
      final c = Completer<List<PackageConditionDetails>>();
      subscription[appId] = notificationRepository(appId: appId)!.listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        var value = list.length > 0;
        if (!c.isCompleted) {
          state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS[appId] = value;
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS,
                value: value)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (value != state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS[appId]) {
            state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS[appId] = value;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS, value));
          }
        }
      }, eliudQuery: getOpenNotificationsQuery(appId, member.documentID));
      return c.future;
    } else {
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS,
            value: false)
      ]);
    }
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [ CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS ];
  }

 @override
  void init() {
    ComponentRegistry().init();

    // wizards
    NewAppWizardRegistry.registry().register(NotificationDashboardDialogDWizard());

    // initialise the repository
    AbstractRepositorySingleton.singleton = RepositorySingleton();

    // initialise the platform
    AbstractNotificationPlatform.platform = NotificationPlatform();

  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;

  static NotificationsPackage instance() => getNotificationsPackage();
}
