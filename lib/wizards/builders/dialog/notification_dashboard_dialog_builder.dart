import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/dialog_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/wizards/builders/dialog_builder.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_pkg_notifications_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications_model/model/notification_dashboard_component.dart';
import 'package:eliud_pkg_notifications_model/model/notification_dashboard_model.dart';

class NotificationDashboardDialogBuilder extends DialogBuilder {
  NotificationDashboardDialogBuilder(
      super.uniqueId, super.app, super.dialogDocumentId);

  Future<DialogModel> create() async {
    await _setupDashboard();
    return await _setupDialog();
  }

  Future<DialogModel> _setupDialog() async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .dialogRepository(app.documentID)!
        .add(_dialog());
  }

  DialogModel _dialog() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "1",
        componentName: AbstractNotificationDashboardComponent.componentName,
        componentId: constructDocumentId(
            uniqueId: uniqueId, documentId: dialogDocumentId)));

    return DialogModel(
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: dialogDocumentId),
        appId: app.documentID,
        title: "Notifications",
        description: "Notifications",
        layout: DialogLayout.listView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple,
        ),
        bodyComponents: components);
  }

  NotificationDashboardModel _dashboardModel() {
    return NotificationDashboardModel(
      documentID:
          constructDocumentId(uniqueId: uniqueId, documentId: dialogDocumentId),
      appId: app.documentID,
      description: "My Notifications",
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
  }

  Future<NotificationDashboardModel> _setupDashboard() async {
    return await AbstractRepositorySingleton.singleton
        .notificationDashboardRepository(app.documentID)!
        .add(_dashboardModel());
  }
}
