/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/dashboard_model.dart';

abstract class DashboardListState extends Equatable {
  const DashboardListState();

  @override
  List<Object> get props => [];
}

class DashboardListLoading extends DashboardListState {}

class DashboardListLoaded extends DashboardListState {
  final List<DashboardModel> values;

  const DashboardListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'DashboardListLoaded { values: $values }';
}

class DashboardNotLoaded extends DashboardListState {}

