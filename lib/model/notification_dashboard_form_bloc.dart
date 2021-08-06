/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_form_bloc.dart
                       
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

import 'package:eliud_pkg_notifications/model/notification_dashboard_form_event.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_form_state.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';

class NotificationDashboardFormBloc extends Bloc<NotificationDashboardFormEvent, NotificationDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  NotificationDashboardFormBloc(this.appId, { this.formAction }): super(NotificationDashboardFormUninitialized());
  @override
  Stream<NotificationDashboardFormState> mapEventToState(NotificationDashboardFormEvent event) async* {
    final currentState = state;
    if (currentState is NotificationDashboardFormUninitialized) {
      if (event is InitialiseNewNotificationDashboardFormEvent) {
        NotificationDashboardFormLoaded loaded = NotificationDashboardFormLoaded(value: NotificationDashboardModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseNotificationDashboardFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        NotificationDashboardFormLoaded loaded = NotificationDashboardFormLoaded(value: await notificationDashboardRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseNotificationDashboardFormNoLoadEvent) {
        NotificationDashboardFormLoaded loaded = NotificationDashboardFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is NotificationDashboardFormInitialized) {
      NotificationDashboardModel? newValue = null;
      if (event is ChangedNotificationDashboardDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableNotificationDashboardForm(value: newValue);
        }

        return;
      }
      if (event is ChangedNotificationDashboardAppId) {
        newValue = currentState.value!.copyWith(appId: event.value);
        yield SubmittableNotificationDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedNotificationDashboardDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableNotificationDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedNotificationDashboardConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableNotificationDashboardForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDNotificationDashboardFormError error(String message, NotificationDashboardModel newValue) => DocumentIDNotificationDashboardFormError(message: message, value: newValue);

  Future<NotificationDashboardFormState> _isDocumentIDValid(String? value, NotificationDashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<NotificationDashboardModel?> findDocument = notificationDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableNotificationDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

