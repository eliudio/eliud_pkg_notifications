/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_notifications/model/dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/dashboard_list_event.dart';
import 'package:eliud_pkg_notifications/model/dashboard_list_state.dart';


class DashboardListBloc extends Bloc<DashboardListEvent, DashboardListState> {
  final DashboardRepository _dashboardRepository;
  StreamSubscription _dashboardsListSubscription;

  DashboardListBloc({ @required DashboardRepository dashboardRepository })
      : assert(dashboardRepository != null),
      _dashboardRepository = dashboardRepository,
      super(DashboardListLoading());

  Stream<DashboardListState> _mapLoadDashboardListToState({ String orderBy, bool descending }) async* {
    _dashboardsListSubscription?.cancel();
    _dashboardsListSubscription = _dashboardRepository.listen((list) => add(DashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<DashboardListState> _mapLoadDashboardListWithDetailsToState() async* {
    _dashboardsListSubscription?.cancel();
    _dashboardsListSubscription = _dashboardRepository.listenWithDetails((list) => add(DashboardListUpdated(value: list)), );
  }

  Stream<DashboardListState> _mapAddDashboardListToState(AddDashboardList event) async* {
    _dashboardRepository.add(event.value);
  }

  Stream<DashboardListState> _mapUpdateDashboardListToState(UpdateDashboardList event) async* {
    _dashboardRepository.update(event.value);
  }

  Stream<DashboardListState> _mapDeleteDashboardListToState(DeleteDashboardList event) async* {
    _dashboardRepository.delete(event.value);
  }

  Stream<DashboardListState> _mapDashboardListUpdatedToState(DashboardListUpdated event) async* {
    yield DashboardListLoaded(values: event.value);
  }


  @override
  Stream<DashboardListState> mapEventToState(DashboardListEvent event) async* {
    final currentState = state;
    if (event is LoadDashboardList) {
      yield* _mapLoadDashboardListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadDashboardListWithDetails) {
      yield* _mapLoadDashboardListWithDetailsToState();
    } else if (event is AddDashboardList) {
      yield* _mapAddDashboardListToState(event);
    } else if (event is UpdateDashboardList) {
      yield* _mapUpdateDashboardListToState(event);
    } else if (event is DeleteDashboardList) {
      yield* _mapDeleteDashboardListToState(event);
    } else if (event is DashboardListUpdated) {
      yield* _mapDashboardListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _dashboardsListSubscription?.cancel();
    return super.close();
  }

}


