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

  NotificationComponentBloc({ this.notificationRepository }): super(NotificationComponentUninitialized());
  @override
  Stream<NotificationComponentState> mapEventToState(NotificationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchNotificationComponent) {
      try {
        if (currentState is NotificationComponentUninitialized) {
          bool permissionDenied = false;
          final model = await notificationRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield NotificationComponentPermissionDenied();
          } else {
            if (model != null) {
              yield NotificationComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield NotificationComponentError(
                  message: "Notification with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield NotificationComponentError(message: "Unknown error whilst retrieving Notification");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

