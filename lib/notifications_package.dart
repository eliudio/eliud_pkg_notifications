import 'dart:async';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/access_event.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_notifications/editors/notification_dashboard_component_editor.dart';
import 'package:eliud_pkg_notifications/extensions/notification_dashboard_component.dart';
import 'package:eliud_pkg_notifications/wizards/notification_dashboard_dialog_wizard.dart';
import 'package:eliud_pkg_notifications_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications_model/model/component_registry.dart';
import 'package:eliud_pkg_notifications_model/model/notification_model.dart';
import 'package:eliud_pkg_notifications_model/model/repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_pkg_notifications/platform/platform.dart';

import 'package:eliud_pkg_notifications/notifications_package_stub.dart'
    if (dart.library.io) 'notifications_mobile_package.dart'
    if (dart.library.html) 'notifications_web_package.dart';

abstract class NotificationsPackage extends Package {
  NotificationsPackage() : super('eliud_pkg_notifications');

  static final String conditionMemberHasUnreadNotifications =
      'Unread Notifications';
  final Map<String, bool?> stateConditionMemberHasUnreadNotifications = {};
  final Map<String, StreamSubscription<List<NotificationModel?>>> subscription =
      {};

  static EliudQuery getOpenNotificationsQuery(
      String? appId, String? assigneeId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
      EliudQueryCondition('appId', isEqualTo: appId),
      EliudQueryCondition('status', isEqualTo: NotificationStatus.open.index)
    ]);
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
      subscription[appId] =
          notificationRepository(appId: appId)!.listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        var value = list.isNotEmpty;
        if (!c.isCompleted) {
          stateConditionMemberHasUnreadNotifications[appId] = value;
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: conditionMemberHasUnreadNotifications,
                value: value)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (value != stateConditionMemberHasUnreadNotifications[appId]) {
            stateConditionMemberHasUnreadNotifications[appId] = value;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, conditionMemberHasUnreadNotifications, value));
          }
        }
      }, eliudQuery: getOpenNotificationsQuery(appId, member.documentID));
      return c.future;
    } else {
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: conditionMemberHasUnreadNotifications,
            value: false)
      ]);
    }
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [conditionMemberHasUnreadNotifications];
  }

  @override
  void init() {
    ComponentRegistry().init(
      NotificationDashboardComponentConstructorDefault(),
      NotificationDashboardComponentEditorConstructor(),
    );

    // wizards
    Apis.apis().getWizardApi()
        .register(NotificationDashboardDialogDWizard());

    // initialise the repository
    AbstractRepositorySingleton.singleton = RepositorySingleton();

    // initialise the platform
    AbstractNotificationPlatform.platform = NotificationPlatform();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() =>
      AbstractRepositorySingleton.collections;

  static NotificationsPackage instance() => getNotificationsPackage();

  /*
   * Register depending packages
   */
  @override
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
  }
}
