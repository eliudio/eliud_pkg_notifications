import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class NotificationDashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationDashboardInitialise extends NotificationDashboardEvent {
  final NotificationDashboardModel model;

  NotificationDashboardInitialise(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDashboardInitialise && model == other.model;
}


class NotificationDashboardApplyChanges extends NotificationDashboardEvent {
  final NotificationDashboardModel model;

  NotificationDashboardApplyChanges({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDashboardApplyChanges && model == other.model;
}

