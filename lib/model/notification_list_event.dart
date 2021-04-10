/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';

abstract class NotificationListEvent extends Equatable {
  const NotificationListEvent();
  @override
  List<Object?> get props => [];
}

class LoadNotificationList extends NotificationListEvent {}

class NewPage extends NotificationListEvent {}

class AddNotificationList extends NotificationListEvent {
  final NotificationModel? value;

  const AddNotificationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddNotificationList{ value: $value }';
}

class UpdateNotificationList extends NotificationListEvent {
  final NotificationModel? value;

  const UpdateNotificationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateNotificationList{ value: $value }';
}

class DeleteNotificationList extends NotificationListEvent {
  final NotificationModel? value;

  const DeleteNotificationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteNotificationList{ value: $value }';
}

class NotificationListUpdated extends NotificationListEvent {
  final List<NotificationModel?>? value;
  final bool? mightHaveMore;

  const NotificationListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'NotificationListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

