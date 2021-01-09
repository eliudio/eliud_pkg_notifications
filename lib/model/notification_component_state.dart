/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';

abstract class NotificationComponentState extends Equatable {
  const NotificationComponentState();

  @override
  List<Object> get props => [];
}

class NotificationComponentUninitialized extends NotificationComponentState {}

class NotificationComponentError extends NotificationComponentState {
  final String message;
  NotificationComponentError({ this.message });
}

class NotificationComponentPermissionDenied extends NotificationComponentState {
  NotificationComponentPermissionDenied();
}

class NotificationComponentLoaded extends NotificationComponentState {
  final NotificationModel value;

  const NotificationComponentLoaded({ this.value });

  NotificationComponentLoaded copyWith({ NotificationModel copyThis }) {
    return NotificationComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'NotificationComponentLoaded { value: $value }';
}

