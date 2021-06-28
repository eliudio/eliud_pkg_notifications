import 'notifications_package.dart';

class NotificationsWebPackage extends NotificationsPackage {

  @override
  List<Object?> get props => [
    state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is NotificationsWebPackage &&
              runtimeType == other.runtimeType &&
              state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS == other.state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS;
}
