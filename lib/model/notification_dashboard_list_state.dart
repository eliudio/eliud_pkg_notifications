/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';

abstract class NotificationDashboardListState extends Equatable {
  const NotificationDashboardListState();

  @override
  List<Object?> get props => [];
}

class NotificationDashboardListLoading extends NotificationDashboardListState {}

class NotificationDashboardListLoaded extends NotificationDashboardListState {
  final List<NotificationDashboardModel?>? values;
  final bool? mightHaveMore;

  const NotificationDashboardListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'NotificationDashboardListLoaded { values: $values }';
}

class NotificationDashboardNotLoaded extends NotificationDashboardListState {}

