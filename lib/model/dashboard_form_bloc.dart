/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

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

import 'package:eliud_pkg_notifications/model/dashboard_form_event.dart';
import 'package:eliud_pkg_notifications/model/dashboard_form_state.dart';
import 'package:eliud_pkg_notifications/model/dashboard_repository.dart';

class DashboardFormBloc extends Bloc<DashboardFormEvent, DashboardFormState> {
  final FormAction formAction;
  final String appId;

  DashboardFormBloc(this.appId, { this.formAction }): super(DashboardFormUninitialized());
  @override
  Stream<DashboardFormState> mapEventToState(DashboardFormEvent event) async* {
    final currentState = state;
    if (currentState is DashboardFormUninitialized) {
      if (event is InitialiseNewDashboardFormEvent) {
        DashboardFormLoaded loaded = DashboardFormLoaded(value: DashboardModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDashboardFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DashboardFormLoaded loaded = DashboardFormLoaded(value: await dashboardRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseDashboardFormNoLoadEvent) {
        DashboardFormLoaded loaded = DashboardFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DashboardFormInitialized) {
      DashboardModel newValue = null;
      if (event is ChangedDashboardDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableDashboardForm(value: newValue);
        }

        return;
      }
      if (event is ChangedDashboardAppId) {
        newValue = currentState.value.copyWith(appId: event.value);
        yield SubmittableDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedDashboardDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableDashboardForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDDashboardFormError error(String message, DashboardModel newValue) => DocumentIDDashboardFormError(message: message, value: newValue);

  Future<DashboardFormState> _isDocumentIDValid(String value, DashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DashboardModel> findDocument = dashboardRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

