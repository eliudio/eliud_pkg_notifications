import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AbstractNotificationPlatform {
  static AbstractNotificationPlatform platform;

  Future<void> sendMessage(BuildContext context, String addresseeMemberId, String message) ;
}

class NotificationPlatform extends AbstractNotificationPlatform {

  Future<void> sendMessage(BuildContext context, String addresseeMemberId, String message) async {
    AccessState accessState = AccessBloc.getState(context);
    if (accessState is LoggedIn) {
      await AbstractRepositorySingleton.singleton.notificationRepository(accessState.app.documentID).add(NotificationModel(
        documentID: newRandomKey(),
        appId:  accessState.app.documentID,
        description: message,
        read: false,
        addresseeMemberId: addresseeMemberId,
        from: accessState.member
      ));
    }
  }
}