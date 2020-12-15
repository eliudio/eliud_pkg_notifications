import 'model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/repository_singleton.dart';
import 'notifications_package.dart';

class NotificationsMobilePackage extends NotificationsPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    super.init();
  }
}
