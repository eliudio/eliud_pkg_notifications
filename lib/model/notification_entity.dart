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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

class NotificationEntity {
  final Object timestamp;
  final String appId;
  final String description;
  final bool read;
  final String reporterId;
  final String assigneeId;
  final int status;

  NotificationEntity({this.timestamp, this.appId, this.description, this.read, this.reporterId, this.assigneeId, this.status, });

  NotificationEntity copyWith({Object timestamp, }) {
    return NotificationEntity(timestamp : timestamp, appId: appId, description: description, read: read, reporterId: reporterId, assigneeId: assigneeId, status: status, );
  }
  List<Object> get props => [timestamp, appId, description, read, reporterId, assigneeId, status, ];

  @override
  String toString() {
    return 'NotificationEntity{timestamp: $timestamp, appId: $appId, description: $description, read: $read, reporterId: $reporterId, assigneeId: $assigneeId, status: $status}';
  }

  static NotificationEntity fromMap(Map map) {
    if (map == null) return null;

    return NotificationEntity(
      timestamp: notificationRepository().timeStampToString(map['timestamp']), 
      appId: map['appId'], 
      description: map['description'], 
      read: map['read'], 
      reporterId: map['reporterId'], 
      assigneeId: map['assigneeId'], 
      status: map['status'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    theDocument["timestamp"] = timestamp;
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (read != null) theDocument["read"] = read;
      else theDocument["read"] = null;
    if (reporterId != null) theDocument["reporterId"] = reporterId;
      else theDocument["reporterId"] = null;
    if (assigneeId != null) theDocument["assigneeId"] = assigneeId;
      else theDocument["assigneeId"] = null;
    if (status != null) theDocument["status"] = status;
      else theDocument["status"] = null;
    return theDocument;
  }

  static NotificationEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

