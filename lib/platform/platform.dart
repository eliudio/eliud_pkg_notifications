import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AbstractNotificationPlatform {
  static AbstractNotificationPlatform? platform;

  Future<void> sendMessage(AppModel app, String memberId, String assigneeId, String message, {Action? postSendAction});
}

typedef void Action(NotificationModel? notificationModel);

class NotificationPlatform extends AbstractNotificationPlatform {

  Future<void> sendMessage(AppModel app, String memberId, String assigneeId, String message, {Action? postSendAction}) async {
      await AbstractRepositorySingleton.singleton.notificationRepository(app.documentID!)!.add(NotificationModel(
        documentID: newRandomKey(),
        appId: app.documentID!,
        description: message,
        read: false,
        status: NotificationStatus.Open,
        assigneeId: assigneeId,
        reporterId: memberId
      )).then((value) {
        if (postSendAction != null) {
          postSendAction(value);
        }
      }
      );
  }
}