/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/notification_dashboard_component.dart';
import '../editors/notification_dashboard_component_editor.dart';
import 'notification_dashboard_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  void init() {
    Apis.apis().addInternalComponents('eliud_pkg_notifications', [
      "notifications",
      "notificationDashboards",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_notifications_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().addDropDownSupporter(
        "notificationDashboards", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "notificationDashboards",
        componentConstructor:
            NotificationDashboardComponentConstructorDefault());
    Apis.apis()
        .addComponentSpec('eliud_pkg_notifications', 'notifications', [
      ComponentSpec(
          'notificationDashboards',
          NotificationDashboardComponentConstructorDefault(),
          NotificationDashboardComponentSelector(),
          NotificationDashboardComponentEditorConstructor(),
          ({String? appId}) => notificationDashboardRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_notifications',
        'notifications',
        ({String? appId}) => notificationRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_notifications',
        'notificationDashboards',
        ({String? appId}) => notificationDashboardRepository(appId: appId)!);
  }
}
