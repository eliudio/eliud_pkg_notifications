/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_notifications/model/embedded_component.dart';
import 'package:eliud_pkg_notifications/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_notifications/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:eliud_pkg_notifications/model/notification_form_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_form_event.dart';
import 'package:eliud_pkg_notifications/model/notification_form_state.dart';


class NotificationForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  NotificationModel? value;
  ActionModel? submitAction;

  NotificationForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<NotificationFormBloc >(
            create: (context) => NotificationFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseNotificationFormEvent(value: value)),
  
        child: MyNotificationForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<NotificationFormBloc >(
            create: (context) => NotificationFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseNotificationFormNoLoadEvent(value: value)),
  
        child: MyNotificationForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Notification' : 'Add Notification'),
        body: BlocProvider<NotificationFormBloc >(
            create: (context) => NotificationFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseNotificationFormEvent(value: value) : InitialiseNewNotificationFormEvent())),
  
        child: MyNotificationForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyNotificationForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyNotificationForm({required this.app, this.formAction, this.submitAction});

  _MyNotificationFormState createState() => _MyNotificationFormState(this.formAction);
}


class _MyNotificationFormState extends State<MyNotificationForm> {
  final FormAction? formAction;
  late NotificationFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool? _readSelection;
  final TextEditingController _reporterIdController = TextEditingController();
  final TextEditingController _assigneeIdController = TextEditingController();
  int? _statusSelectedRadioTile;


  _MyNotificationFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<NotificationFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _readSelection = false;
    _reporterIdController.addListener(_onReporterIdChanged);
    _assigneeIdController.addListener(_onAssigneeIdChanged);
    _statusSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<NotificationFormBloc, NotificationFormState>(builder: (context, state) {
      if (state is NotificationFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is NotificationFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.read != null)
        _readSelection = state.value!.read;
        else
        _readSelection = false;
        if (state.value!.reporterId != null)
          _reporterIdController.text = state.value!.reporterId.toString();
        else
          _reporterIdController.text = "";
        if (state.value!.assigneeId != null)
          _assigneeIdController.text = state.value!.assigneeId.toString();
        else
          _assigneeIdController.text = "";
        if (state.value!.status != null)
          _statusSelectedRadioTile = state.value!.status!.index;
        else
          _statusSelectedRadioTile = 0;
      }
      if (state is NotificationFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().checkboxListTile(widget.app, context, 'Has this been read?', _readSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionRead(val))
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'Closed', 'Closed', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'Open', 'Open', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionStatus(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDNotificationFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionNotificationFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Reporter')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Reporter', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _reporterIdController, keyboardType: TextInputType.text, validator: (_) => state is ReporterIdNotificationFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Assignee')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Assignee', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _assigneeIdController, keyboardType: TextInputType.text, validator: (_) => state is AssigneeIdNotificationFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is NotificationFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<NotificationListBloc>(context).add(
                          UpdateNotificationList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              timestamp: state.value!.timestamp, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              read: state.value!.read, 
                              reporterId: state.value!.reporterId, 
                              assigneeId: state.value!.assigneeId, 
                              status: state.value!.status, 
                        )));
                      } else {
                        BlocProvider.of<NotificationListBloc>(context).add(
                          AddNotificationList(value: NotificationModel(
                              documentID: state.value!.documentID, 
                              timestamp: state.value!.timestamp, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              read: state.value!.read, 
                              reporterId: state.value!.reporterId, 
                              assigneeId: state.value!.assigneeId, 
                              status: state.value!.status, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedNotificationDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedNotificationAppId(value: _appIdController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedNotificationDescription(value: _descriptionController.text));
  }


  void setSelectionRead(bool? val) {
    setState(() {
      _readSelection = val;
    });
    _myFormBloc.add(ChangedNotificationRead(value: val));
  }

  void _onReporterIdChanged() {
    _myFormBloc.add(ChangedNotificationReporterId(value: _reporterIdController.text));
  }


  void _onAssigneeIdChanged() {
    _myFormBloc.add(ChangedNotificationAssigneeId(value: _assigneeIdController.text));
  }


  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedNotificationStatus(value: toNotificationStatus(val)));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    _reporterIdController.dispose();
    _assigneeIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, NotificationFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



