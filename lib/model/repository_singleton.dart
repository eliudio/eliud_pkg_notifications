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
import '../model/dashboard_firestore.dart';
import '../model/dashboard_repository.dart';
import '../model/dashboard_cache.dart';
import '../model/notification_firestore.dart';
import '../model/notification_repository.dart';
import '../model/notification_cache.dart';

import '../model/notification_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _dashboardRepository = HashMap<String, DashboardRepository>();
    var _notificationRepository = HashMap<String, NotificationRepository>();

    DashboardRepository dashboardRepository(String appId) {
      if (_dashboardRepository[appId] == null) _dashboardRepository[appId] = DashboardCache(DashboardFirestore(appRepository().getSubCollection(appId, 'dashboard'), appId));
      return _dashboardRepository[appId];
    }
    NotificationRepository notificationRepository(String appId) {
      if (_notificationRepository[appId] == null) _notificationRepository[appId] = NotificationCache(NotificationFirestore(appRepository().getSubCollection(appId, 'notification'), appId));
      return _notificationRepository[appId];
    }

}
