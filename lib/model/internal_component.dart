/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list.dart';
import 'package:eliud_pkg_notifications/model/notification_dropdown_button.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';

import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_pkg_notifications/model/notification_dashboard_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_list.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_list_event.dart';


class ListComponentFactory implements ComponentConstructor {
  Widget? createNew({Key? key, required AppModel app,  required String id, int? privilegeLevel, Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}


typedef DropdownButtonChanged(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }


  bool supports(String id) {

    if (id == "notifications") return true;
    if (id == "notificationDashboards") return true;
    return false;
  }

  Widget createNew({Key? key, required AppModel app, required String id, int? privilegeLevel, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional}) {

    if (id == "notifications")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "notificationDashboards")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    return Text("Id $id not found");
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  Widget? widget;
  int? privilegeLevel;

  @override
  Widget? fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'notifications') return _notificationBuild(context);
    if (componentId == 'notificationDashboards') return _notificationDashboardBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  void initWidget() {
    if (componentId == 'notifications') widget = NotificationListWidget(app: app);
    if (componentId == 'notificationDashboards') widget = NotificationDashboardListWidget(app: app);
  }

  Widget _notificationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationListBloc>(
          create: (context) => NotificationListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            notificationRepository: notificationRepository(appId: app.documentID)!,
          )..add(LoadNotificationList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _notificationDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationDashboardListBloc>(
          create: (context) => NotificationDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            notificationDashboardRepository: notificationDashboardRepository(appId: app.documentID)!,
          )..add(LoadNotificationDashboardList()),
        )
      ],
      child: widget!,
    );
  }

}


typedef Changed(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  int? privilegeLevel;

  DropdownButtonComponent({required this.app, this.componentId, this.privilegeLevel, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'notifications') return _notificationBuild(context);
    if (componentId == 'notificationDashboards') return _notificationDashboardBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _notificationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationListBloc>(
          create: (context) => NotificationListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            notificationRepository: notificationRepository(appId: app.documentID)!,
          )..add(LoadNotificationList()),
        )
      ],
      child: NotificationDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _notificationDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationDashboardListBloc>(
          create: (context) => NotificationDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            notificationDashboardRepository: notificationDashboardRepository(appId: app.documentID)!,
          )..add(LoadNotificationDashboardList()),
        )
      ],
      child: NotificationDashboardDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

}


