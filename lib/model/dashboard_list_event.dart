/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/dashboard_model.dart';

abstract class DashboardListEvent extends Equatable {
  const DashboardListEvent();
  @override
  List<Object> get props => [];
}

class LoadDashboardList extends DashboardListEvent {
  final String orderBy;
  final bool descending;

  LoadDashboardList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadDashboardListWithDetails extends DashboardListEvent {}

class AddDashboardList extends DashboardListEvent {
  final DashboardModel value;

  const AddDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDashboardList{ value: $value }';
}

class UpdateDashboardList extends DashboardListEvent {
  final DashboardModel value;

  const UpdateDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDashboardList{ value: $value }';
}

class DeleteDashboardList extends DashboardListEvent {
  final DashboardModel value;

  const DeleteDashboardList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDashboardList{ value: $value }';
}

class DashboardListUpdated extends DashboardListEvent {
  final List<DashboardModel> value;

  const DashboardListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DashboardListUpdated{ value: $value }';
}

