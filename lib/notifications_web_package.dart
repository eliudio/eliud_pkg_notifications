import 'package:flutter/foundation.dart';
import 'notifications_package.dart';

NotificationsPackage getNotificationsPackage() => NotificationsWebPackage();

class NotificationsWebPackage extends NotificationsPackage {
  @override
  List<Object?> get props => [stateConditionMemberHasUnreadNotifications];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsWebPackage &&
          runtimeType == other.runtimeType &&
          mapEquals(stateConditionMemberHasUnreadNotifications,
              other.stateConditionMemberHasUnreadNotifications);

  @override
  int get hashCode => stateConditionMemberHasUnreadNotifications.hashCode;
}
