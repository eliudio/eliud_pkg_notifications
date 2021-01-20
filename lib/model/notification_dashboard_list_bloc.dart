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
import 'package:eliud_core/tools/query/query_tools.dart';


const _notificationDashboardLimit = 5;

class NotificationDashboardListBloc extends Bloc<NotificationDashboardListEvent, NotificationDashboardListState> {
  final NotificationDashboardRepository _notificationDashboardRepository;
  StreamSubscription _notificationDashboardsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  NotificationDashboardListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required NotificationDashboardRepository notificationDashboardRepository})
      : assert(notificationDashboardRepository != null),
        _notificationDashboardRepository = notificationDashboardRepository,
        super(NotificationDashboardListLoading());

  Stream<NotificationDashboardListState> _mapLoadNotificationDashboardListToState() async* {
    int amountNow =  (state is NotificationDashboardListLoaded) ? (state as NotificationDashboardListLoaded).values.length : 0;
    _notificationDashboardsListSubscription?.cancel();
    _notificationDashboardsListSubscription = _notificationDashboardRepository.listen(
          (list) => add(NotificationDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _notificationDashboardLimit : null
    );
  }

  Stream<NotificationDashboardListState> _mapLoadNotificationDashboardListWithDetailsToState() async* {
    int amountNow =  (state is NotificationDashboardListLoaded) ? (state as NotificationDashboardListLoaded).values.length : 0;
    _notificationDashboardsListSubscription?.cancel();
    _notificationDashboardsListSubscription = _notificationDashboardRepository.listenWithDetails(
            (list) => add(NotificationDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _notificationDashboardLimit : null
    );
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

  Stream<NotificationDashboardListState> _mapNotificationDashboardListUpdatedToState(
      NotificationDashboardListUpdated event) async* {
    yield NotificationDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<NotificationDashboardListState> mapEventToState(NotificationDashboardListEvent event) async* {
    if (event is LoadNotificationDashboardList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadNotificationDashboardListToState();
      } else {
        yield* _mapLoadNotificationDashboardListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


