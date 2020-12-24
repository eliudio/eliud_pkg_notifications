/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';


@immutable
abstract class DashboardFormEvent extends Equatable {
  const DashboardFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewDashboardFormEvent extends DashboardFormEvent {
}


class InitialiseDashboardFormEvent extends DashboardFormEvent {
  final DashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDashboardFormEvent({this.value});
}

class InitialiseDashboardFormNoLoadEvent extends DashboardFormEvent {
  final DashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDashboardFormNoLoadEvent({this.value});
}

class ChangedDashboardDocumentID extends DashboardFormEvent {
  final String value;

  ChangedDashboardDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDashboardDocumentID{ value: $value }';
}

class ChangedDashboardAppId extends DashboardFormEvent {
  final String value;

  ChangedDashboardAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDashboardAppId{ value: $value }';
}

class ChangedDashboardDescription extends DashboardFormEvent {
  final String value;

  ChangedDashboardDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDashboardDescription{ value: $value }';
}

