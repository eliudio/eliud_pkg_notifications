/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class NotificationDashboardListBloc extends Bloc<NotificationDashboardListEvent, NotificationDashboardListState> {
  final NotificationDashboardRepository _notificationDashboardRepository;
  StreamSubscription _notificationDashboardsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  NotificationDashboardListBloc(this.accessBloc,{ this.eliudQuery, @required NotificationDashboardRepository notificationDashboardRepository })
      : assert(notificationDashboardRepository != null),
      _notificationDashboardRepository = notificationDashboardRepository,
      super(NotificationDashboardListLoading());

  Stream<NotificationDashboardListState> _mapLoadNotificationDashboardListToState({ String orderBy, bool descending }) async* {
    _notificationDashboardsListSubscription?.cancel();
    _notificationDashboardsListSubscription = _notificationDashboardRepository.listen((list) => add(NotificationDashboardListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<NotificationDashboardListState> _mapLoadNotificationDashboardListWithDetailsToState() async* {
    _notificationDashboardsListSubscription?.cancel();
    _notificationDashboardsListSubscription = _notificationDashboardRepository.listenWithDetails((list) => add(NotificationDashboardListUpdated(value: list)), );
  }

  Stream<NotificationDashboardListState> _mapAddNotificationDashboardListToState(AddNotificationDashboardList event) async* {
    _notificationDashboardRepository.add(event.value);
  }

  Stream<NotificationDashboardListState> _mapUpdateNotificationDashboardListToState(UpdateNotificationDashboardList event) async* {
    _notificationDashboardRepository.update(event.value);
  }

  Stream<NotificationDashboardListState> _mapDeleteNotificationDashboardListToState(DeleteNotificationDashboardList event) async* {
    _notificationDashboardRepository.delete(event.value);
  }

  Stream<NotificationDashboardListState> _mapNotificationDashboardListUpdatedToState(NotificationDashboardListUpdated event) async* {
    yield NotificationDashboardListLoaded(values: event.value);
  }


  @override
  Stream<NotificationDashboardListState> mapEventToState(NotificationDashboardListEvent event) async* {
    final currentState = state;
    if (event is LoadNotificationDashboardList) {
      yield* _mapLoadNotificationDashboardListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadNotificationDashboardListWithDetails) {
      yield* _mapLoadNotificationDashboardListWithDetailsToState();
    } else if (event is AddNotificationDashboardList) {
      yield* _mapAddNotificationDashboardListToState(event);
    } else if (event is UpdateNotificationDashboardList) {
      yield* _mapUpdateNotificationDashboardListToState(event);
    } else if (event is DeleteNotificationDashboardList) {
      yield* _mapDeleteNotificationDashboardListToState(event);
    } else if (event is NotificationDashboardListUpdated) {
      yield* _mapNotificationDashboardListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _notificationDashboardsListSubscription?.cancel();
    return super.close();
  }

}


