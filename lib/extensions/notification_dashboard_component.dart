import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_notifications/extensions/widgets/my_notification_list_item.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_component.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/notification_list.dart';
import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notifications_package.dart';

class NotificationDashboardComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return NotificationDashboardComponent(id: id);
  }
}

class NotificationDashboardComponent extends AbstractNotificationDashboardComponent {
  NotificationDashboardComponent({String id}) : super(notificationDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(BuildContext context, NotificationDashboardModel DashboardModel) {
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      return BlocProvider<NotificationListBloc>(
        create: (context) => NotificationListBloc(
          eliudQuery: NotificationsPackage.getOpenNotificationsQuery(
              state.app.documentID, state.getMember().documentID),
          notificationRepository:
          notificationRepository(appId: AccessBloc.appId(context)),
        )..add(LoadNotificationList()),
        child: NotificationListWidget(
            readOnly: true,
            widgetProvider: widgetProvider,
            listBackground: BackgroundModel(documentID: "`transparent")),
      );
    } else {
      return DelayedCircularProgressIndicator();
    }
  }

  Widget widgetProvider(NotificationModel value) {
    return MyNotificationListItem(value: value);
  }

  @override
  NotificationDashboardRepository getNotificationDashboardRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .notificationDashboardRepository(AccessBloc.appId(context));
  }
}
