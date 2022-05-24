/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_notifications/model/notification_dashboard_component_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_component_event.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractNotificationDashboardComponent extends StatelessWidget {
  static String componentName = "notificationDashboards";
  final AppModel app;
  final String notificationDashboardId;

  AbstractNotificationDashboardComponent({Key? key, required this.app, required this.notificationDashboardId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationDashboardComponentBloc> (
          create: (context) => NotificationDashboardComponentBloc(
            notificationDashboardRepository: notificationDashboardRepository(appId: app.documentID)!)
        ..add(FetchNotificationDashboardComponent(id: notificationDashboardId)),
      child: _notificationDashboardBlockBuilder(context),
    );
  }

  Widget _notificationDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<NotificationDashboardComponentBloc, NotificationDashboardComponentState>(builder: (context, state) {
      if (state is NotificationDashboardComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No NotificationDashboard defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is NotificationDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is NotificationDashboardComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, NotificationDashboardModel value);
}

