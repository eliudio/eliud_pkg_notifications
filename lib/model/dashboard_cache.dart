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

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_notifications/model/dashboard_model.dart';
import 'package:eliud_pkg_notifications/model/dashboard_repository.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_pkg_notifications/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

class DashboardCache implements DashboardRepository {

  final DashboardRepository reference;
  final Map<String, DashboardModel> fullCache = Map();

  DashboardCache(this.reference);

  Future<DashboardModel> add(DashboardModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(DashboardModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<DashboardModel> get(String id){
    DashboardModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<DashboardModel> update(DashboardModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<DashboardModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<DashboardModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<DashboardModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<DashboardModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  void flush() {
    fullCache.clear();
  }
  
  String timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }


  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<DashboardModel>> listen(trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel, EliudQuery eliudQuery}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<DashboardModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel, EliudQuery eliudQuery}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<DashboardModel> listenTo(String documentId, changed) {
    reference.listenTo(documentId, changed);
  }

  static Future<DashboardModel> refreshRelations(DashboardModel model) async {

    return model.copyWith(

    );
  }

}

