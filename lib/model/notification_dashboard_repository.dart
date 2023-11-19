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
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef NotificationDashboardModelTrigger = Function(
    List<NotificationDashboardModel?> list);
typedef NotificationDashboardChanged = Function(
    NotificationDashboardModel? value);
typedef NotificationDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class NotificationDashboardRepository extends RepositoryBase<
    NotificationDashboardModel, NotificationDashboardEntity> {
  @override
  Future<NotificationDashboardEntity> addEntity(
      String documentID, NotificationDashboardEntity value);
  @override
  Future<NotificationDashboardEntity> updateEntity(
      String documentID, NotificationDashboardEntity value);
  @override
  Future<NotificationDashboardModel> add(NotificationDashboardModel value);
  @override
  Future<void> delete(NotificationDashboardModel value);
  @override
  Future<NotificationDashboardModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<NotificationDashboardModel> update(NotificationDashboardModel value);

  @override
  Stream<List<NotificationDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<NotificationDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<NotificationDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<NotificationDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<NotificationDashboardModel?>> listen(
      NotificationDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<NotificationDashboardModel?>> listenWithDetails(
      NotificationDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<NotificationDashboardModel?> listenTo(
      String documentId, NotificationDashboardChanged changed,
      {NotificationDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<NotificationDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
