/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/notification_firestore.dart';
import '../model/notification_repository.dart';
import '../model/notification_cache.dart';
import '../model/notification_dashboard_firestore.dart';
import '../model/notification_dashboard_repository.dart';
import '../model/notification_dashboard_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _notificationRepository = HashMap<String, NotificationRepository>();
  final _notificationDashboardRepository =
      HashMap<String, NotificationDashboardRepository>();

  @override
  NotificationRepository? notificationRepository(String? appId) {
    if ((appId != null) && (_notificationRepository[appId] == null)) {
      _notificationRepository[appId] = NotificationCache(NotificationFirestore(
          () => appRepository()!.getSubCollection(appId, 'notification'),
          appId));
    }
    return _notificationRepository[appId];
  }

  @override
  NotificationDashboardRepository? notificationDashboardRepository(
      String? appId) {
    if ((appId != null) && (_notificationDashboardRepository[appId] == null)) {
      _notificationDashboardRepository[appId] = NotificationDashboardCache(
          NotificationDashboardFirestore(
              () => appRepository()!
                  .getSubCollection(appId, 'notificationdashboard'),
              appId));
    }
    return _notificationDashboardRepository[appId];
  }
}
