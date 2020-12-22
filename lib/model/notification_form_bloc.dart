/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

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

import 'package:eliud_pkg_notifications/model/notification_form_event.dart';
import 'package:eliud_pkg_notifications/model/notification_form_state.dart';
import 'package:eliud_pkg_notifications/model/notification_repository.dart';

class NotificationFormBloc extends Bloc<NotificationFormEvent, NotificationFormState> {
  final FormAction formAction;
  final String appId;

  NotificationFormBloc(this.appId, { this.formAction }): super(NotificationFormUninitialized());
  @override
  Stream<NotificationFormState> mapEventToState(NotificationFormEvent event) async* {
    final currentState = state;
    if (currentState is NotificationFormUninitialized) {
      if (event is InitialiseNewNotificationFormEvent) {
        NotificationFormLoaded loaded = NotificationFormLoaded(value: NotificationModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseNotificationFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        NotificationFormLoaded loaded = NotificationFormLoaded(value: await notificationRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseNotificationFormNoLoadEvent) {
        NotificationFormLoaded loaded = NotificationFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is NotificationFormInitialized) {
      NotificationModel newValue = null;
      if (event is ChangedNotificationDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableNotificationForm(value: newValue);
        }

        return;
      }
      if (event is ChangedNotificationDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableNotificationForm(value: newValue);

        return;
      }
      if (event is ChangedNotificationRead) {
        newValue = currentState.value.copyWith(read: event.value);
        yield SubmittableNotificationForm(value: newValue);

        return;
      }
      if (event is ChangedNotificationAddressee) {
        if (event.value != null)
          newValue = currentState.value.copyWith(addressee: await memberRepository(appId: appId).get(event.value));
        else
          newValue = new NotificationModel(
                                 documentID: currentState.value.documentID,
                                 timestamp: currentState.value.timestamp,
                                 appId: currentState.value.appId,
                                 description: currentState.value.description,
                                 read: currentState.value.read,
                                 addressee: null,
                                 action: currentState.value.action,
          );
        yield SubmittableNotificationForm(value: newValue);

        return;
      }
      if (event is ChangedNotificationAction) {
        newValue = currentState.value.copyWith(action: event.value);
        yield SubmittableNotificationForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDNotificationFormError error(String message, NotificationModel newValue) => DocumentIDNotificationFormError(message: message, value: newValue);

  Future<NotificationFormState> _isDocumentIDValid(String value, NotificationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<NotificationModel> findDocument = notificationRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableNotificationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

