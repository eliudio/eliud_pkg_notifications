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

/* 
 * NotificationComponentState is the base class for state for NotificationComponentBloc
 */
abstract class NotificationComponentState extends Equatable {
  const NotificationComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * NotificationComponentUninitialized is the uninitialized state of the NotificationComponentBloc 
 */
class NotificationComponentUninitialized extends NotificationComponentState {}

/* 
 * NotificationComponentError is the error state of the NotificationComponentBloc 
 */
class NotificationComponentError extends NotificationComponentState {
  final String? message;
  NotificationComponentError({this.message});
}

/* 
 * NotificationComponentPermissionDenied is to indicate permission denied state of the NotificationComponentBloc 
 */
class NotificationComponentPermissionDenied extends NotificationComponentState {
  NotificationComponentPermissionDenied();
}

/* 
 * NotificationComponentLoaded is used to set the state of the NotificationComponentBloc to the loaded state
 */
class NotificationComponentLoaded extends NotificationComponentState {
  final NotificationModel value;

  /* 
   * construct NotificationComponentLoaded
   */
  const NotificationComponentLoaded({required this.value});

  /* 
   * copy method
   */
  NotificationComponentLoaded copyWith({NotificationModel? copyThis}) {
    return NotificationComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'NotificationComponentLoaded { value: $value }';
}
