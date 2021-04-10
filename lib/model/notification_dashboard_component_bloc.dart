/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_component_event.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_component_state.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';
import 'package:flutter/services.dart';

class NotificationDashboardComponentBloc extends Bloc<NotificationDashboardComponentEvent, NotificationDashboardComponentState> {
  final NotificationDashboardRepository? notificationDashboardRepository;

  NotificationDashboardComponentBloc({ this.notificationDashboardRepository }): super(NotificationDashboardComponentUninitialized());
  @override
  Stream<NotificationDashboardComponentState> mapEventToState(NotificationDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchNotificationDashboardComponent) {
      try {
        if (currentState is NotificationDashboardComponentUninitialized) {
          bool permissionDenied = false;
          final model = await notificationDashboardRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield NotificationDashboardComponentPermissionDenied();
          } else {
            if (model != null) {
              yield NotificationDashboardComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield NotificationDashboardComponentError(
                  message: "NotificationDashboard with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield NotificationDashboardComponentError(message: "Unknown error whilst retrieving NotificationDashboard");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

