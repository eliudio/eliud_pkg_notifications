import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';

abstract class AbstractNotificationPlatform {
  static AbstractNotificationPlatform? platform;

  Future<void> sendMessage(
      AppModel app, String memberId, String assigneeId, String message,
      {Action? postSendAction});
}

typedef Action = void Function(NotificationModel? notificationModel);

class NotificationPlatform extends AbstractNotificationPlatform {
  @override
  Future<void> sendMessage(
      AppModel app, String memberId, String assigneeId, String message,
      {Action? postSendAction}) async {
    await AbstractRepositorySingleton.singleton
        .notificationRepository(app.documentID)!
        .add(NotificationModel(
            documentID: newRandomKey(),
            appId: app.documentID,
            description: message,
            read: false,
            status: NotificationStatus.open,
            assigneeId: assigneeId,
            reporterId: memberId))
        .then((value) {
      if (postSendAction != null) {
        postSendAction(value);
      }
    });
  }
}
