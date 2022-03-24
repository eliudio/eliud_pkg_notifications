import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';

import 'notification_dashboard_state.dart';
import 'notification_dashoard_event.dart';

class NotificationDashboardBloc
    extends Bloc<NotificationDashboardEvent, NotificationDashboardState> {
  final String appId;
//  final bool create; // don't think I need this!!!
  final EditorFeedback feedback;

  NotificationDashboardBloc(this.appId, /*this.create, */ this.feedback)
      : super(NotificationDashboardUninitialised());

  @override
  Stream<NotificationDashboardState> mapEventToState(
      NotificationDashboardEvent event) async* {
    if (event is NotificationDashboardInitialise) {
      List<PublicMediumModel>? media = [];
      // retrieve the model, as it was retrieved without links
      var modelWithLinks = await notificationDashboardRepository(appId: appId)!
          .get(event.model.documentID);
      if (modelWithLinks == null) {
        modelWithLinks = NotificationDashboardModel(
          documentID: newRandomKey(),
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        );
      } else {
        modelWithLinks = modelWithLinks.copyWith(
          conditions: modelWithLinks.conditions ??
              StorageConditionsModel(
                  privilegeLevelRequired:
                      PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        );
      }
      yield NotificationDashboardInitialised(
        model: modelWithLinks,
      );
    }
  }

  Future<void> save(NotificationDashboardApplyChanges event) async {
    if (state is NotificationDashboardInitialised) {
      var theState = state as NotificationDashboardInitialised;
      var newModel = theState.model;
      if (await notificationDashboardRepository(appId: appId)!
              .get(newModel.documentID!) ==
          null) {
        await notificationDashboardRepository(appId: appId)!.add(newModel);
      } else {
        await notificationDashboardRepository(appId: appId)!.update(newModel);
      }
      feedback(true);
    }
  }
}
