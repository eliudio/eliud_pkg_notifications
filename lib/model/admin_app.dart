/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/admin_app_base.dart';
import '../tools/bespoke_models.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;

  /// Construct the AdminApp
  AdminApp(
      this.appId,
      this._drawer,
      this._endDrawer,
      this._appBar,
      this._homeMenu,
      this.menuItemColor,
      this.selectedMenuItemColor,
      this.backgroundColor);

  /// Retrieve the admin pages
  PageModel _notificationsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-notifications",
        componentName: "eliud_pkg_notifications_internalWidgets",
        componentId: "notifications"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_notifications_notifications_page",
        title: "Notifications",
        description: "Notifications",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _notificationDashboardsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-notificationDashboards",
        componentName: "eliud_pkg_notifications_internalWidgets",
        componentId: "notificationDashboards"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_notifications_notificationdashboards_page",
        title: "NotificationDashboards",
        description: "NotificationDashboards",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  Future<void> _setupAdminPages() {
    return pageRepository(appId: appId)!.add(_notificationsPages()).then((_) =>
        pageRepository(appId: appId)!.add(_notificationDashboardsPages()));
  }

  /// Run the admin, i.e setup all admin pages
  @override
  Future<void> run() async {
    return _setupAdminPages();
  }
}

class AdminMenu extends AdminAppMenuInstallerBase {
  /// Construct the admin menu
  @override
  Future<MenuDefModel> menu(AppModel app) async {
    var menuItems = <MenuItemModel>[];

    menuItems.add(MenuItemModel(
        documentID: "Notifications",
        text: "Notifications",
        description: "Notifications",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_notifications_notifications_page")));

    menuItems.add(MenuItemModel(
        documentID: "NotificationDashboards",
        text: "NotificationDashboards",
        description: "NotificationDashboards",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_notifications_notificationdashboards_page")));

    MenuDefModel menu = MenuDefModel(
        admin: true,
        documentID: "eliud_pkg_notifications_admin_menu",
        appId: app.documentID,
        name: "eliud_pkg_notifications",
        menuItems: menuItems);
    await menuDefRepository(appId: app.documentID)!.add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {
  /// Delete all admin pages
  @override
  Future<void> deleteAll(String appID) async {}
}
