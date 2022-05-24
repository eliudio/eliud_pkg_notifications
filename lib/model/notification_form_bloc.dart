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
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

import 'package:eliud_pkg_notifications/model/notification_form_event.dart';
import 'package:eliud_pkg_notifications/model/notification_form_state.dart';
import 'package:eliud_pkg_notifications/model/notification_repository.dart';

class NotificationFormBloc extends Bloc<NotificationFormEvent, NotificationFormState> {
  final FormAction? formAction;
  final String? appId;

  NotificationFormBloc(this.appId, { this.formAction }): super(NotificationFormUninitialized());
  @override
  Stream<NotificationFormState> mapEventToState(NotificationFormEvent event) async* {
    final currentState = state;
    if (currentState is NotificationFormUninitialized) {
      on <InitialiseNewNotificationFormEvent> ((event, emit) {
        NotificationFormLoaded loaded = NotificationFormLoaded(value: NotificationModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 reporterId: "",
                                 assigneeId: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseNotificationFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        NotificationFormLoaded loaded = NotificationFormLoaded(value: await notificationRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseNotificationFormNoLoadEvent) {
        NotificationFormLoaded loaded = NotificationFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is NotificationFormInitialized) {
      NotificationModel? newValue = null;
      on <ChangedNotificationDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableNotificationForm(value: newValue));
        }

      });
      on <ChangedNotificationDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableNotificationForm(value: newValue));

      });
      on <ChangedNotificationRead> ((event, emit) async {
        newValue = currentState.value!.copyWith(read: event.value);
        emit(SubmittableNotificationForm(value: newValue));

      });
      on <ChangedNotificationReporterId> ((event, emit) async {
        newValue = currentState.value!.copyWith(reporterId: event.value);
        emit(SubmittableNotificationForm(value: newValue));

      });
      on <ChangedNotificationAssigneeId> ((event, emit) async {
        newValue = currentState.value!.copyWith(assigneeId: event.value);
        emit(SubmittableNotificationForm(value: newValue));

      });
      on <ChangedNotificationStatus> ((event, emit) async {
        newValue = currentState.value!.copyWith(status: event.value);
        emit(SubmittableNotificationForm(value: newValue));

      });
    }
  }


  DocumentIDNotificationFormError error(String message, NotificationModel newValue) => DocumentIDNotificationFormError(message: message, value: newValue);

  Future<NotificationFormState> _isDocumentIDValid(String? value, NotificationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<NotificationModel?> findDocument = notificationRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableNotificationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

