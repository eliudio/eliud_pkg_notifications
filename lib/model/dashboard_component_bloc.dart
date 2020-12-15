/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_notifications/model/dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/dashboard_component_event.dart';
import 'package:eliud_pkg_notifications/model/dashboard_component_state.dart';
import 'package:eliud_pkg_notifications/model/dashboard_repository.dart';
class DashboardComponentBloc extends Bloc<DashboardComponentEvent, DashboardComponentState> {
  final DashboardRepository dashboardRepository;

  DashboardComponentBloc({ this.dashboardRepository }): super(DashboardComponentUninitialized());
  @override
  Stream<DashboardComponentState> mapEventToState(DashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDashboardComponent) {
      try {
        if (currentState is DashboardComponentUninitialized) {
          final DashboardModel model = await _fetchDashboard(event.id);

          if (model != null) {
            yield DashboardComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield DashboardComponentError(message: "Dashboard with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield DashboardComponentError(message: "Unknown error whilst retrieving Dashboard");
      }
    }
  }

  Future<DashboardModel> _fetchDashboard(String id) async {
    return dashboardRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


