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

import '../model/notification_repository.dart';
import '../model/notification_dashboard_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

NotificationRepository notificationRepository({ String appId }) => AbstractRepositorySingleton.singleton.notificationRepository(appId);
NotificationDashboardRepository notificationDashboardRepository({ String appId }) => AbstractRepositorySingleton.singleton.notificationDashboardRepository(appId);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  NotificationRepository notificationRepository(String appId);
  NotificationDashboardRepository notificationDashboardRepository(String appId);

  void flush(String appId) {
  }
}
