/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';

/*
 * NotificationComponentEvent is the base class for events to be used with constructing a NotificationComponentBloc 
 */
abstract class NotificationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchNotificationComponent is the event to instruct the bloc to fetch the component
 */
class FetchNotificationComponent extends NotificationComponentEvent {
  final String? id;

  /*
   * Construct the FetchNotificationComponent
   */
  FetchNotificationComponent({this.id});
}

/*
 * NotificationComponentUpdated is the event to inform the bloc that a component has been updated
 */
class NotificationComponentUpdated extends NotificationComponentEvent {
  final NotificationModel value;

  /*
   * Construct the NotificationComponentUpdated
   */
  NotificationComponentUpdated({required this.value});
}
