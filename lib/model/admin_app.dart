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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appId, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  PageModel _dashboardsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-dashboards", componentName: "eliud_pkg_notifications_internalWidgets", componentId: "dashboards"));
    PageModel page = PageModel(
        readCondition: ReadCondition.AsSpecifiedInPrivilegeLevelRequired,
        privilegeLevelRequired: 99999,
        appId: appId,
        documentID: "eliud_pkg_notifications_dashboards_page",
        title: "Dashboards",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _notificationsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-notifications", componentName: "eliud_pkg_notifications_internalWidgets", componentId: "notifications"));
    PageModel page = PageModel(
        readCondition: ReadCondition.AsSpecifiedInPrivilegeLevelRequired,
        privilegeLevelRequired: 99999,
        appId: appId,
        documentID: "eliud_pkg_notifications_notifications_page",
        title: "Notifications",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  Future<void> _setupAdminPages() {

    return pageRepository(appId: appId).add(_dashboardsPages())

        .then((_) => pageRepository(appId: appId).add(_notificationsPages()))

    ;
  }

  @override
  Future<void> run() async {
    return _setupAdminPages();
  }


}

class AdminMenu extends AdminAppMenuInstallerBase {

  Future<MenuDefModel> menu(String appId) async {
    List<MenuItemModel> menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        documentID: "Dashboards",
        text: "Dashboards",
        description: "Dashboards",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_pkg_notifications_dashboards_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Notifications",
        text: "Notifications",
        description: "Notifications",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_pkg_notifications_notifications_page"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "eliud_pkg_notifications_admin_menu",
      appId: appId,
      name: "eliud_pkg_notifications",
      menuItems: menuItems
    );
    await menuDefRepository(appId: appId).add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {

  @override
  Future<void> deleteAll(String appId) async {
    await dashboardRepository(appId: appId).deleteAll();
    await notificationRepository(appId: appId).deleteAll();
    ;
  }


}

