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

import 'package:eliud_pkg_notifications/model/notification_dashboard_component_event.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_component_state.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';

class NotificationDashboardComponentBloc extends Bloc<NotificationDashboardComponentEvent, NotificationDashboardComponentState> {
  final NotificationDashboardRepository? notificationDashboardRepository;
  StreamSubscription? _notificationDashboardSubscription;

  void _mapLoadNotificationDashboardComponentUpdateToState(String documentId) {
    _notificationDashboardSubscription?.cancel();
    _notificationDashboardSubscription = notificationDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(NotificationDashboardComponentUpdated(value: value));
      }
    });
  }

  NotificationDashboardComponentBloc({ this.notificationDashboardRepository }): super(NotificationDashboardComponentUninitialized()) {
    on <FetchNotificationDashboardComponent> ((event, emit) {
      _mapLoadNotificationDashboardComponentUpdateToState(event.id!);
    });
    on <NotificationDashboardComponentUpdated> ((event, emit) {
      emit(NotificationDashboardComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _notificationDashboardSubscription?.cancel();
    return super.close();
  }

}

