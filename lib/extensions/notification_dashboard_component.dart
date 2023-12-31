import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_pkg_notifications/extensions/widgets/my_notification_list_item.dart';
import 'package:eliud_pkg_notifications_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications_model/model/notification_dashboard_component.dart';
import 'package:eliud_pkg_notifications_model/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_notifications_model/model/notification_list.dart';
import 'package:eliud_pkg_notifications_model/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications_model/model/notification_list_event.dart';
import 'package:eliud_pkg_notifications_model/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notifications_package.dart';

class NotificationDashboardComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return NotificationDashboardComponent(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await notificationDashboardRepository(appId: app.documentID)!.get(id);
}

class NotificationDashboardComponent
    extends AbstractNotificationDashboardComponent {
  NotificationDashboardComponent(
      {super.key, required super.app, required String id})
      : super(notificationDashboardId: id);

  @override
  Widget yourWidget(BuildContext context, NotificationDashboardModel? value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return BlocProvider<NotificationListBloc>(
          create: (context) => NotificationListBloc(
            eliudQuery: NotificationsPackage.getOpenNotificationsQuery(
                app.documentID, accessState.getMember()!.documentID),
            notificationRepository:
                notificationRepository(appId: app.documentID)!,
          )..add(LoadNotificationList()),
          child: NotificationListWidget(
              app: app,
              readOnly: true,
              widgetProvider: widgetProvider,
              listBackground: BackgroundModel()),
        );
      } else {
        return progressIndicator(app, context);
      }
    });
  }

  Widget widgetProvider(NotificationModel? value) {
    if (value != null) {
      return MyNotificationListItem(app: app, value: value);
    } else {
      return Text("Value for notification model is null");
    }
  }
}
