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

abstract class NotificationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNotificationComponent extends NotificationComponentEvent {
  final String? id;

  FetchNotificationComponent({ this.id });
}

class NotificationComponentUpdated extends NotificationComponentEvent {
  final NotificationModel value;

  NotificationComponentUpdated({ required this.value });
}


