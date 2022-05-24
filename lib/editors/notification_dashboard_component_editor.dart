import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

class NotificationDashboardComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        NotificationDashboardModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New notification dashboard',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var notificationDashboard =
        await notificationDashboardRepository(appId: app.documentID)!.get(id);
    if (notificationDashboard != null) {
      _openIt(app, context, false, notificationDashboard, feedback);
    } else {
      openErrorDialog(app, context, app.documentID + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      NotificationDashboardModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<NotificationDashboardBloc>(
          create: (context) => NotificationDashboardBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<NotificationDashboardModel>(model)),
          child: NotificationDashboardComponentEditor(
            app: app,
          )),
    );
  }
}

class NotificationDashboardBloc
    extends EditorBaseBloc<NotificationDashboardModel> {

  NotificationDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, notificationDashboardRepository(appId: appId)!, feedback);

  @override
  NotificationDashboardModel newInstance(StorageConditionsModel conditions) {
    return NotificationDashboardModel(
        appId: appId,
        documentID: newRandomKey(),
        description: 'New notification dashboard',
        conditions: conditions);
  }

  @override
  NotificationDashboardModel setDefaultValues(
      NotificationDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}

class NotificationDashboardComponentEditor extends StatefulWidget {
  final AppModel app;

  const NotificationDashboardComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _NotificationDashboardComponentEditorState();
}

class _NotificationDashboardComponentEditorState
    extends State<NotificationDashboardComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<NotificationDashboardBloc, EditorBaseState<NotificationDashboardModel>>(
            builder: (ppContext, notificationDashboardState) {
          if (notificationDashboardState is EditorBaseInitialised<NotificationDashboardModel>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'NotificationDashboard',
                    okAction: () async {
                      await BlocProvider.of<NotificationDashboardBloc>(context)
                          .save(EditorBaseApplyChanges<NotificationDashboardModel>(
                              model: notificationDashboardState.model));
                      return true;
                    },
                    cancelAction: () async {
                      return true;
                    },
                  ),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                notificationDashboardState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: notificationDashboardState.model.description,
                              valueChanged: (value) {
                                notificationDashboardState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Condition',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: notificationDashboardState.model.conditions!,
                            )),
                      ]),
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

}
