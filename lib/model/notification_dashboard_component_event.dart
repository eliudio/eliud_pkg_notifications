/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';

/*
 * NotificationDashboardComponentEvent is the base class for events to be used with constructing a NotificationDashboardComponentBloc 
 */
abstract class NotificationDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchNotificationDashboardComponent is the event to instruct the bloc to fetch the component
 */
class FetchNotificationDashboardComponent
    extends NotificationDashboardComponentEvent {
  final String? id;

  /*
   * Construct the FetchNotificationDashboardComponent
   */
  FetchNotificationDashboardComponent({this.id});
}

/*
 * NotificationDashboardComponentUpdated is the event to inform the bloc that a component has been updated
 */
class NotificationDashboardComponentUpdated
    extends NotificationDashboardComponentEvent {
  final NotificationDashboardModel value;

  /*
   * Construct the NotificationDashboardComponentUpdated
   */
  NotificationDashboardComponentUpdated({required this.value});
}
