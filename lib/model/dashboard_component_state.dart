/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_notifications/model/dashboard_model.dart';

abstract class DashboardComponentState extends Equatable {
  const DashboardComponentState();

  @override
  List<Object> get props => [];
}

class DashboardComponentUninitialized extends DashboardComponentState {}

class DashboardComponentError extends DashboardComponentState {
  final String message;
  DashboardComponentError({ this.message });
}

class DashboardComponentLoaded extends DashboardComponentState {
  final DashboardModel value;

  const DashboardComponentLoaded({ this.value });

  DashboardComponentLoaded copyWith({ DashboardModel copyThis }) {
    return DashboardComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'DashboardComponentLoaded { value: $value }';
}


