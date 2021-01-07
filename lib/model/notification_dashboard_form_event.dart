/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_form_event.dart
                       
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
abstract class NotificationDashboardFormEvent extends Equatable {
  const NotificationDashboardFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewNotificationDashboardFormEvent extends NotificationDashboardFormEvent {
}


class InitialiseNotificationDashboardFormEvent extends NotificationDashboardFormEvent {
  final NotificationDashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseNotificationDashboardFormEvent({this.value});
}

class InitialiseNotificationDashboardFormNoLoadEvent extends NotificationDashboardFormEvent {
  final NotificationDashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseNotificationDashboardFormNoLoadEvent({this.value});
}

class ChangedNotificationDashboardDocumentID extends NotificationDashboardFormEvent {
  final String value;

  ChangedNotificationDashboardDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationDashboardDocumentID{ value: $value }';
}

class ChangedNotificationDashboardAppId extends NotificationDashboardFormEvent {
  final String value;

  ChangedNotificationDashboardAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationDashboardAppId{ value: $value }';
}

class ChangedNotificationDashboardDescription extends NotificationDashboardFormEvent {
  final String value;

  ChangedNotificationDashboardDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationDashboardDescription{ value: $value }';
}
