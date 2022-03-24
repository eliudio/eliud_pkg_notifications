import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationDashboardState extends Equatable {
  const NotificationDashboardState();

  @override
  List<Object?> get props => [];
}

class NotificationDashboardUninitialised extends NotificationDashboardState {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NotificationDashboardUninitialised;
}

class NotificationDashboardInitialised extends NotificationDashboardState {
  final NotificationDashboardModel model;

  const NotificationDashboardInitialised(
      {required this.model});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDashboardInitialised &&
          model == other.model;

  @override
  List<Object?> get props => [model, ];
}

class NotificationDashboardLoaded extends NotificationDashboardInitialised {
  const NotificationDashboardLoaded(
      {required NotificationDashboardModel model, })
      : super(model: model, );
}

class NotificationDashboardError extends NotificationDashboardInitialised {
  final String error;

  const NotificationDashboardError({
    required this.error,
    required NotificationDashboardModel model,
      }) : super(
          model: model,
        );
}
