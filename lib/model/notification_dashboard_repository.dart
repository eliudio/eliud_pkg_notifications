/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef NotificationDashboardModelTrigger(List<NotificationDashboardModel?> list);
typedef NotificationDashboardChanged(NotificationDashboardModel? value);
typedef NotificationDashboardErrorHandler(o, e);

abstract class NotificationDashboardRepository extends RepositoryBase<NotificationDashboardModel, NotificationDashboardEntity> {
  Future<NotificationDashboardEntity> addEntity(String documentID, NotificationDashboardEntity value);
  Future<NotificationDashboardEntity> updateEntity(String documentID, NotificationDashboardEntity value);
  Future<NotificationDashboardModel> add(NotificationDashboardModel value);
  Future<void> delete(NotificationDashboardModel value);
  Future<NotificationDashboardModel?> get(String? id, { Function(Exception)? onError });
  Future<NotificationDashboardModel> update(NotificationDashboardModel value);

  Stream<List<NotificationDashboardModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<NotificationDashboardModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<NotificationDashboardModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<NotificationDashboardModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<NotificationDashboardModel?>> listen(NotificationDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<NotificationDashboardModel?>> listenWithDetails(NotificationDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<NotificationDashboardModel?> listenTo(String documentId, NotificationDashboardChanged changed, {NotificationDashboardErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<NotificationDashboardModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


