/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_notifications/model/notification_component_event.dart';
import 'package:eliud_pkg_notifications/model/notification_component_state.dart';
import 'package:eliud_pkg_notifications/model/notification_repository.dart';

class NotificationComponentBloc
    extends Bloc<NotificationComponentEvent, NotificationComponentState> {
  final NotificationRepository? notificationRepository;
  StreamSubscription? _notificationSubscription;

  void _mapLoadNotificationComponentUpdateToState(String documentId) {
    _notificationSubscription?.cancel();
    _notificationSubscription =
        notificationRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(NotificationComponentUpdated(value: value));
      }
    });
  }

  NotificationComponentBloc({this.notificationRepository})
      : super(NotificationComponentUninitialized()) {
    on<FetchNotificationComponent>((event, emit) {
      _mapLoadNotificationComponentUpdateToState(event.id!);
    });
    on<NotificationComponentUpdated>((event, emit) {
      emit(NotificationComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    return super.close();
  }
}
