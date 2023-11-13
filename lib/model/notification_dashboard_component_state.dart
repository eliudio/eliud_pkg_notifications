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

/* 
 * NotificationDashboardComponentState is the base class for state for NotificationDashboardComponentBloc
 */
abstract class NotificationDashboardComponentState extends Equatable {
  const NotificationDashboardComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * NotificationDashboardComponentUninitialized is the uninitialized state of the NotificationDashboardComponentBloc 
 */
class NotificationDashboardComponentUninitialized
    extends NotificationDashboardComponentState {}

/* 
 * NotificationDashboardComponentError is the error state of the NotificationDashboardComponentBloc 
 */
class NotificationDashboardComponentError
    extends NotificationDashboardComponentState {
  final String? message;
  NotificationDashboardComponentError({this.message});
}

/* 
 * NotificationDashboardComponentPermissionDenied is to indicate permission denied state of the NotificationDashboardComponentBloc 
 */
class NotificationDashboardComponentPermissionDenied
    extends NotificationDashboardComponentState {
  NotificationDashboardComponentPermissionDenied();
}

/* 
 * NotificationDashboardComponentLoaded is used to set the state of the NotificationDashboardComponentBloc to the loaded state
 */
class NotificationDashboardComponentLoaded
    extends NotificationDashboardComponentState {
  final NotificationDashboardModel value;

  /* 
   * construct NotificationDashboardComponentLoaded
   */
  const NotificationDashboardComponentLoaded({required this.value});

  /* 
   * copy method
   */
  NotificationDashboardComponentLoaded copyWith(
      {NotificationDashboardModel? copyThis}) {
    return NotificationDashboardComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'NotificationDashboardComponentLoaded { value: $value }';
}
