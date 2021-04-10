/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';

abstract class NotificationDashboardComponentState extends Equatable {
  const NotificationDashboardComponentState();

  @override
  List<Object?> get props => [];
}

class NotificationDashboardComponentUninitialized extends NotificationDashboardComponentState {}

class NotificationDashboardComponentError extends NotificationDashboardComponentState {
  final String? message;
  NotificationDashboardComponentError({ this.message });
}

class NotificationDashboardComponentPermissionDenied extends NotificationDashboardComponentState {
  NotificationDashboardComponentPermissionDenied();
}

class NotificationDashboardComponentLoaded extends NotificationDashboardComponentState {
  final NotificationDashboardModel? value;

  const NotificationDashboardComponentLoaded({ this.value });

  NotificationDashboardComponentLoaded copyWith({ NotificationDashboardModel? copyThis }) {
    return NotificationDashboardComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'NotificationDashboardComponentLoaded { value: $value }';
}

