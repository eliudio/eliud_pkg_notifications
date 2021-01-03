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
class NotificationComponentBloc extends Bloc<NotificationComponentEvent, NotificationComponentState> {
  final NotificationRepository notificationRepository;

  NotificationComponentBloc({ this.notificationRepository }): super(NotificationComponentUninitialized());
  @override
  Stream<NotificationComponentState> mapEventToState(NotificationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchNotificationComponent) {
      try {
        if (currentState is NotificationComponentUninitialized) {
          final NotificationModel model = await _fetchNotification(event.id);

          if (model != null) {
            yield NotificationComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield NotificationComponentError(message: "Notification with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield NotificationComponentError(message: "Unknown error whilst retrieving Notification");
      }
    }
  }

  Future<NotificationModel> _fetchNotification(String id) async {
    return notificationRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


