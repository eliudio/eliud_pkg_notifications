import 'package:flutter/foundation.dart';
import 'notifications_package.dart';

NotificationsPackage getNotificationsPackage() => NotificationsMobilePackage();

class NotificationsMobilePackage extends NotificationsPackage {

  @override
  List<Object?> get props => [
    state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is NotificationsMobilePackage &&
              runtimeType == other.runtimeType &&
              mapEquals(state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS, other.state_CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS);

}
