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

abstract class NotificationDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNotificationDashboardComponent
    extends NotificationDashboardComponentEvent {
  final String? id;

  FetchNotificationDashboardComponent({this.id});
}

class NotificationDashboardComponentUpdated
    extends NotificationDashboardComponentEvent {
  final NotificationDashboardModel value;

  NotificationDashboardComponentUpdated({required this.value});
}
