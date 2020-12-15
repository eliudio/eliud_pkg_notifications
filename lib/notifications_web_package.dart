import 'model/abstract_repository_singleton.dart';
import 'model/js_repository_singleton.dart';
import 'notifications_package.dart';

class NotificationsWebPackage extends NotificationsPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton();
    super.init();
  }
}
