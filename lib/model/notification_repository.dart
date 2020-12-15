/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_notifications/model/notification_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef NotificationModelTrigger(List<NotificationModel> list);

abstract class NotificationRepository {
  Future<NotificationModel> add(NotificationModel value);
  Future<void> delete(NotificationModel value);
  Future<NotificationModel> get(String id);
  Future<NotificationModel> update(NotificationModel value);

  Stream<List<NotificationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<NotificationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<NotificationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<NotificationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<NotificationModel>> listen(NotificationModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<NotificationModel>> listenWithDetails(NotificationModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


