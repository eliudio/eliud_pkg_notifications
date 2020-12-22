/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_form_event.dart
                       
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';


@immutable
abstract class NotificationFormEvent extends Equatable {
  const NotificationFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewNotificationFormEvent extends NotificationFormEvent {
}


class InitialiseNotificationFormEvent extends NotificationFormEvent {
  final NotificationModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseNotificationFormEvent({this.value});
}

class InitialiseNotificationFormNoLoadEvent extends NotificationFormEvent {
  final NotificationModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseNotificationFormNoLoadEvent({this.value});
}

class ChangedNotificationDocumentID extends NotificationFormEvent {
  final String value;

  ChangedNotificationDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationDocumentID{ value: $value }';
}

class ChangedNotificationTimestamp extends NotificationFormEvent {
  final DateTime value;

  ChangedNotificationTimestamp({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationTimestamp{ value: $value }';
}

class ChangedNotificationAppId extends NotificationFormEvent {
  final String value;

  ChangedNotificationAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationAppId{ value: $value }';
}

class ChangedNotificationDescription extends NotificationFormEvent {
  final String value;

  ChangedNotificationDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationDescription{ value: $value }';
}

class ChangedNotificationRead extends NotificationFormEvent {
  final bool value;

  ChangedNotificationRead({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationRead{ value: $value }';
}

class ChangedNotificationAddressee extends NotificationFormEvent {
  final String value;

  ChangedNotificationAddressee({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationAddressee{ value: $value }';
}

class ChangedNotificationAction extends NotificationFormEvent {
  final ActionModel value;

  ChangedNotificationAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedNotificationAction{ value: $value }';
}

