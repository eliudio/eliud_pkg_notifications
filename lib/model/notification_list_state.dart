/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';

abstract class NotificationListState extends Equatable {
  const NotificationListState();

  @override
  List<Object> get props => [];
}

class NotificationListLoading extends NotificationListState {}

class NotificationListLoaded extends NotificationListState {
  final List<NotificationModel> values;
  final bool mightHaveMore;

  const NotificationListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'NotificationListLoaded { values: $values }';
}

class NotificationNotLoaded extends NotificationListState {}

