import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'model/component_registry.dart';

abstract class NotificationsPackage extends Package {
  static final String CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS = 'Unread Notifications';

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc) => null;

  @override
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner) async {
    if (pluginCondition == CONDITION_MEMBER_HAS_UNREAD_NOTIFICATIONS) {
      // find notifications for this member. If unread notifications found: return true;
      // for now we return true, just to make this functionality available
      return true;
    }
    return null;
  }

  @override
  void init() {
    ComponentRegistry().init();
  }
}
