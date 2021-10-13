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

import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:eliud_pkg_notifications/model/notification_component_event.dart';
import 'package:eliud_pkg_notifications/model/notification_component_state.dart';
import 'package:eliud_pkg_notifications/model/notification_repository.dart';
import 'package:flutter/services.dart';

class NotificationComponentBloc extends Bloc<NotificationComponentEvent, NotificationComponentState> {
  final NotificationRepository? notificationRepository;
  StreamSubscription? _notificationSubscription;

  Stream<NotificationComponentState> _mapLoadNotificationComponentUpdateToState(String documentId) async* {
    _notificationSubscription?.cancel();
    _notificationSubscription = notificationRepository!.listenTo(documentId, (value) {
      if (value != null) add(NotificationComponentUpdated(value: value!));
    });
  }

  NotificationComponentBloc({ this.notificationRepository }): super(NotificationComponentUninitialized());

  @override
  Stream<NotificationComponentState> mapEventToState(NotificationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchNotificationComponent) {
      yield* _mapLoadNotificationComponentUpdateToState(event.id!);
    } else if (event is NotificationComponentUpdated) {
      yield NotificationComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    return super.close();
  }

}

