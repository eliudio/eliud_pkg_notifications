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

import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'notification_dashboard_model.dart';

typedef FilterNotificationDashboardModels = List<NotificationDashboardModel?>
    Function(List<NotificationDashboardModel?> values);

class NotificationDashboardListBloc extends Bloc<NotificationDashboardListEvent,
    NotificationDashboardListState> {
  final FilterNotificationDashboardModels? filter;
  final NotificationDashboardRepository _notificationDashboardRepository;
  StreamSubscription? _notificationDashboardsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int notificationDashboardLimit;

  NotificationDashboardListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required NotificationDashboardRepository notificationDashboardRepository,
      this.notificationDashboardLimit = 5})
      : _notificationDashboardRepository = notificationDashboardRepository,
        super(NotificationDashboardListLoading()) {
    on<LoadNotificationDashboardList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadNotificationDashboardListToState();
      } else {
        _mapLoadNotificationDashboardListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadNotificationDashboardListWithDetailsToState();
    });

    on<NotificationDashboardChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadNotificationDashboardListToState();
      } else {
        _mapLoadNotificationDashboardListWithDetailsToState();
      }
    });

    on<AddNotificationDashboardList>((event, emit) async {
      await _mapAddNotificationDashboardListToState(event);
    });

    on<UpdateNotificationDashboardList>((event, emit) async {
      await _mapUpdateNotificationDashboardListToState(event);
    });

    on<DeleteNotificationDashboardList>((event, emit) async {
      await _mapDeleteNotificationDashboardListToState(event);
    });

    on<NotificationDashboardListUpdated>((event, emit) {
      emit(_mapNotificationDashboardListUpdatedToState(event));
    });
  }

  List<NotificationDashboardModel?> _filter(
      List<NotificationDashboardModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadNotificationDashboardListToState() async {
    int amountNow = (state is NotificationDashboardListLoaded)
        ? (state as NotificationDashboardListLoaded).values!.length
        : 0;
    _notificationDashboardsListSubscription?.cancel();
    _notificationDashboardsListSubscription =
        _notificationDashboardRepository.listen(
            (list) => add(NotificationDashboardListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * notificationDashboardLimit
                : null);
  }

  Future<void> _mapLoadNotificationDashboardListWithDetailsToState() async {
    int amountNow = (state is NotificationDashboardListLoaded)
        ? (state as NotificationDashboardListLoaded).values!.length
        : 0;
    _notificationDashboardsListSubscription?.cancel();
    _notificationDashboardsListSubscription =
        _notificationDashboardRepository.listenWithDetails(
            (list) => add(NotificationDashboardListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * notificationDashboardLimit
                : null);
  }

  Future<void> _mapAddNotificationDashboardListToState(
      AddNotificationDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _notificationDashboardRepository.add(value);
    }
  }

  Future<void> _mapUpdateNotificationDashboardListToState(
      UpdateNotificationDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _notificationDashboardRepository.update(value);
    }
  }

  Future<void> _mapDeleteNotificationDashboardListToState(
      DeleteNotificationDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _notificationDashboardRepository.delete(value);
    }
  }

  NotificationDashboardListLoaded _mapNotificationDashboardListUpdatedToState(
          NotificationDashboardListUpdated event) =>
      NotificationDashboardListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _notificationDashboardsListSubscription?.cancel();
    return super.close();
  }
}
