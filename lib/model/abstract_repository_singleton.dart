/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/dashboard_repository.dart';
import '../model/notification_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

DashboardRepository dashboardRepository({ String appId }) => AbstractRepositorySingleton.singleton.dashboardRepository(appId);
NotificationRepository notificationRepository({ String appId }) => AbstractRepositorySingleton.singleton.notificationRepository(appId);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  DashboardRepository dashboardRepository(String appId);
  NotificationRepository notificationRepository(String appId);

  void flush(String appId) {
  }
}
