/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_notifications/model/dashboard_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef DashboardModelTrigger(List<DashboardModel> list);

abstract class DashboardRepository {
  Future<DashboardModel> add(DashboardModel value);
  Future<void> delete(DashboardModel value);
  Future<DashboardModel> get(String id);
  Future<DashboardModel> update(DashboardModel value);

  Stream<List<DashboardModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<DashboardModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<DashboardModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<DashboardModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<DashboardModel>> listen(DashboardModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<DashboardModel>> listenWithDetails(DashboardModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


