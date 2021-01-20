/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';

abstract class NotificationDashboardListEvent extends Equatable {
  const NotificationDashboardListEvent();
  @override
  List<Object> get props => [];
}

class LoadNotificationDashboardList extends NotificationDashboardListEvent {}

class NewPage extends NotificationDashboardListEvent {}

class AddNotificationDashboardList extends NotificationDashboardListEvent {
  final NotificationDashboardModel value;

  const AddNotificationDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddNotificationDashboardList{ value: $value }';
}

class UpdateNotificationDashboardList extends NotificationDashboardListEvent {
  final NotificationDashboardModel value;

  const UpdateNotificationDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateNotificationDashboardList{ value: $value }';
}

class DeleteNotificationDashboardList extends NotificationDashboardListEvent {
  final NotificationDashboardModel value;

  const DeleteNotificationDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteNotificationDashboardList{ value: $value }';
}

class NotificationDashboardListUpdated extends NotificationDashboardListEvent {
  final List<NotificationDashboardModel> value;
  final bool mightHaveMore;

  const NotificationDashboardListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'NotificationDashboardListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

