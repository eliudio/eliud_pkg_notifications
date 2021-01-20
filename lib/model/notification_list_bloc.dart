/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_notifications/model/notification_repository.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _notificationLimit = 5;

class NotificationListBloc extends Bloc<NotificationListEvent, NotificationListState> {
  final NotificationRepository _notificationRepository;
  StreamSubscription _notificationsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  NotificationListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required NotificationRepository notificationRepository})
      : assert(notificationRepository != null),
        _notificationRepository = notificationRepository,
        super(NotificationListLoading());

  Stream<NotificationListState> _mapLoadNotificationListToState() async* {
    int amountNow =  (state is NotificationListLoaded) ? (state as NotificationListLoaded).values.length : 0;
    _notificationsListSubscription?.cancel();
    _notificationsListSubscription = _notificationRepository.listen(
          (list) => add(NotificationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _notificationLimit : null
    );
  }

  Stream<NotificationListState> _mapLoadNotificationListWithDetailsToState() async* {
    int amountNow =  (state is NotificationListLoaded) ? (state as NotificationListLoaded).values.length : 0;
    _notificationsListSubscription?.cancel();
    _notificationsListSubscription = _notificationRepository.listenWithDetails(
            (list) => add(NotificationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _notificationLimit : null
    );
  }

  Stream<NotificationListState> _mapAddNotificationListToState(AddNotificationList event) async* {
    _notificationRepository.add(event.value);
  }

  Stream<NotificationListState> _mapUpdateNotificationListToState(UpdateNotificationList event) async* {
    _notificationRepository.update(event.value);
  }

  Stream<NotificationListState> _mapDeleteNotificationListToState(DeleteNotificationList event) async* {
    _notificationRepository.delete(event.value);
  }

  Stream<NotificationListState> _mapNotificationListUpdatedToState(
      NotificationListUpdated event) async* {
    yield NotificationListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<NotificationListState> mapEventToState(NotificationListEvent event) async* {
    if (event is LoadNotificationList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadNotificationListToState();
      } else {
        yield* _mapLoadNotificationListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadNotificationListWithDetailsToState();
    } else if (event is AddNotificationList) {
      yield* _mapAddNotificationListToState(event);
    } else if (event is UpdateNotificationList) {
      yield* _mapUpdateNotificationListToState(event);
    } else if (event is DeleteNotificationList) {
      yield* _mapDeleteNotificationListToState(event);
    } else if (event is NotificationListUpdated) {
      yield* _mapNotificationListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _notificationsListSubscription?.cancel();
    return super.close();
  }
}


