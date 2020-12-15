/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_notifications/model/dashboard_component_bloc.dart';
import 'package:eliud_pkg_notifications/model/dashboard_component_event.dart';
import 'package:eliud_pkg_notifications/model/dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/dashboard_component_state.dart';

abstract class AbstractDashboardComponent extends StatelessWidget {
  static String componentName = "dashboards";
  final String dashboardID;

  AbstractDashboardComponent({this.dashboardID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardComponentBloc> (
          create: (context) => DashboardComponentBloc(
            dashboardRepository: getDashboardRepository(context))
        ..add(FetchDashboardComponent(id: dashboardID)),
      child: _dashboardBlockBuilder(context),
    );
  }

  Widget _dashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<DashboardComponentBloc, DashboardComponentState>(builder: (context, state) {
      if (state is DashboardComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No dashboard defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DashboardComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DashboardModel value);
  Widget alertWidget({ title: String, content: String});
  DashboardRepository getDashboardRepository(BuildContext context);
}


