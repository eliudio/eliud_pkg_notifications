/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';

class NotificationEntity implements EntityBase {
  final Object? timestamp;
  final String? appId;
  final String? description;
  final bool? read;
  final String? reporterId;
  final String? assigneeId;
  final int? status;

  NotificationEntity({
    this.timestamp,
    required this.appId,
    this.description,
    this.read,
    this.reporterId,
    this.assigneeId,
    this.status,
  });

  NotificationEntity copyWith({
    String? documentID,
    Object? timestamp,
    String? appId,
    String? description,
    bool? read,
    String? reporterId,
    String? assigneeId,
    int? status,
  }) {
    return NotificationEntity(
      timestamp: timestamp ?? this.timestamp,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      read: read ?? this.read,
      reporterId: reporterId ?? this.reporterId,
      assigneeId: assigneeId ?? this.assigneeId,
      status: status ?? this.status,
    );
  }

  List<Object?> get props => [
        timestamp,
        appId,
        description,
        read,
        reporterId,
        assigneeId,
        status,
      ];

  @override
  String toString() {
    return 'NotificationEntity{timestamp: $timestamp, appId: $appId, description: $description, read: $read, reporterId: $reporterId, assigneeId: $assigneeId, status: $status}';
  }

  static NotificationEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return NotificationEntity(
      timestamp: map['timestamp'] == null
          ? null
          : (map['timestamp'] as Timestamp).millisecondsSinceEpoch,
      appId: map['appId'],
      description: map['description'],
      read: map['read'],
      reporterId: map['reporterId'],
      assigneeId: map['assigneeId'],
      status: map['status'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    theDocument["timestamp"] = timestamp;
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (read != null) {
      theDocument["read"] = read;
    } else {
      theDocument["read"] = null;
    }
    if (reporterId != null) {
      theDocument["reporterId"] = reporterId;
    } else {
      theDocument["reporterId"] = null;
    }
    if (assigneeId != null) {
      theDocument["assigneeId"] = assigneeId;
    } else {
      theDocument["assigneeId"] = null;
    }
    if (status != null) {
      theDocument["status"] = status;
    } else {
      theDocument["status"] = null;
    }
    return theDocument;
  }

  @override
  NotificationEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static NotificationEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
