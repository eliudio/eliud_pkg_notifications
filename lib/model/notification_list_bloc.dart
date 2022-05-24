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



class NotificationListBloc extends Bloc<NotificationListEvent, NotificationListState> {
  final NotificationRepository _notificationRepository;
  StreamSubscription? _notificationsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int notificationLimit;

  NotificationListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required NotificationRepository notificationRepository, this.notificationLimit = 5})
      : assert(notificationRepository != null),
        _notificationRepository = notificationRepository,
        super(NotificationListLoading()) {
    on <LoadNotificationList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadNotificationListToState();
      } else {
        _mapLoadNotificationListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadNotificationListWithDetailsToState();
    });
    
    on <NotificationChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadNotificationListToState();
      } else {
        _mapLoadNotificationListWithDetailsToState();
      }
    });
      
    on <AddNotificationList> ((event, emit) async {
      await _mapAddNotificationListToState(event);
    });
    
    on <UpdateNotificationList> ((event, emit) async {
      await _mapUpdateNotificationListToState(event);
    });
    
    on <DeleteNotificationList> ((event, emit) async {
      await _mapDeleteNotificationListToState(event);
    });
    
    on <NotificationListUpdated> ((event, emit) {
      emit(_mapNotificationListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadNotificationListToState() async {
    int amountNow =  (state is NotificationListLoaded) ? (state as NotificationListLoaded).values!.length : 0;
    _notificationsListSubscription?.cancel();
    _notificationsListSubscription = _notificationRepository.listen(
          (list) => add(NotificationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * notificationLimit : null
    );
  }

  Future<void> _mapLoadNotificationListWithDetailsToState() async {
    int amountNow =  (state is NotificationListLoaded) ? (state as NotificationListLoaded).values!.length : 0;
    _notificationsListSubscription?.cancel();
    _notificationsListSubscription = _notificationRepository.listenWithDetails(
            (list) => add(NotificationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * notificationLimit : null
    );
  }

  Future<void> _mapAddNotificationListToState(AddNotificationList event) async {
    var value = event.value;
    if (value != null) {
      await _notificationRepository.add(value);
    }
  }

  Future<void> _mapUpdateNotificationListToState(UpdateNotificationList event) async {
    var value = event.value;
    if (value != null) {
      await _notificationRepository.update(value);
    }
  }

  Future<void> _mapDeleteNotificationListToState(DeleteNotificationList event) async {
    var value = event.value;
    if (value != null) {
      await _notificationRepository.delete(value);
    }
  }

  NotificationListLoaded _mapNotificationListUpdatedToState(
      NotificationListUpdated event) => NotificationListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _notificationsListSubscription?.cancel();
    return super.close();
  }
}


