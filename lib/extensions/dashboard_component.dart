import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/dashboard_component.dart';
import 'package:eliud_pkg_notifications/model/dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/dashboard_repository.dart';
import 'package:eliud_pkg_notifications/model/notification_list.dart';
import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return DashboardComponent(id: id);
  }
}

class DashboardComponent extends AbstractDashboardComponent {
  DashboardComponent({String id}) : super(dashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(BuildContext context, DashboardModel DashboardModel) {
    return BlocProvider<NotificationListBloc>(
      create: (context) => NotificationListBloc(
        AccessBloc.getBloc(context),
        notificationRepository:
            notificationRepository(appId: AccessBloc.appId(context)),
      )..add(LoadNotificationList()),
      child: NotificationListWidget(
          readOnly: true,
          listItemWidget: "MyNotificationListItem",
          listBackground: BackgroundModel(documentID: "`transparent")),
    );
  }

  @override
  DashboardRepository getDashboardRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .dashboardRepository(AccessBloc.appId(context));
  }
}
