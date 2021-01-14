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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class NotificationListBloc extends Bloc<NotificationListEvent, NotificationListState> {
  final NotificationRepository _notificationRepository;
  StreamSubscription _notificationsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  NotificationListBloc(this.accessBloc,{ this.eliudQuery, @required NotificationRepository notificationRepository })
      : assert(notificationRepository != null),
      _notificationRepository = notificationRepository,
      super(NotificationListLoading());

  Stream<NotificationListState> _mapLoadNotificationListToState({ String orderBy, bool descending }) async* {
    _notificationsListSubscription?.cancel();
    _notificationsListSubscription = _notificationRepository.listen((list) => add(NotificationListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<NotificationListState> _mapLoadNotificationListWithDetailsToState({ String orderBy, bool descending }) async* {
    _notificationsListSubscription?.cancel();
    _notificationsListSubscription = _notificationRepository.listenWithDetails((list) => add(NotificationListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
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

  Stream<NotificationListState> _mapNotificationListUpdatedToState(NotificationListUpdated event) async* {
    yield NotificationListLoaded(values: event.value);
  }


  @override
  Stream<NotificationListState> mapEventToState(NotificationListEvent event) async* {
    final currentState = state;
    if (event is LoadNotificationList) {
      yield* _mapLoadNotificationListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadNotificationListWithDetails) {
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


