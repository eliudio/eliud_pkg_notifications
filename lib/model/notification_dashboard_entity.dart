/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class NotificationDashboardEntity implements EntityBase {
  final String? appId;
  final String? description;
  final StorageConditionsEntity? conditions;

  NotificationDashboardEntity({required this.appId, this.description, this.conditions, });

  NotificationDashboardEntity copyWith({String? documentID, String? appId, String? description, StorageConditionsEntity? conditions, }) {
    return NotificationDashboardEntity(appId : appId ?? this.appId, description : description ?? this.description, conditions : conditions ?? this.conditions, );
  }
  List<Object?> get props => [appId, description, conditions, ];

  @override
  String toString() {
    return 'NotificationDashboardEntity{appId: $appId, description: $description, conditions: $conditions}';
  }

  static NotificationDashboardEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap, newDocumentIds: newDocumentIds);

    return NotificationDashboardEntity(
      appId: map['appId'], 
      description: map['description'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  @override
  NotificationDashboardEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static NotificationDashboardEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

