/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';


import 'package:eliud_pkg_notifications/model/notification_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum NotificationStatus {
  Closed, Open, Unknown
}


NotificationStatus toNotificationStatus(int? index) {
  switch (index) {
    case 0: return NotificationStatus.Closed;
    case 1: return NotificationStatus.Open;
  }
  return NotificationStatus.Unknown;
}


class NotificationModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_notifications';
  static const String id = 'Notification';

  String documentID;
  DateTime? timestamp;

  // This is the identifier of the app to which this feed belongs
  String appId;
  String? description;
  bool? read;
  String? reporterId;
  String? assigneeId;
  NotificationStatus? status;

  NotificationModel({required this.documentID, this.timestamp, required this.appId, this.description, this.read, this.reporterId, this.assigneeId, this.status, })  {
    assert(documentID != null);
  }

  NotificationModel copyWith({String? documentID, DateTime? timestamp, String? appId, String? description, bool? read, String? reporterId, String? assigneeId, NotificationStatus? status, }) {
    return NotificationModel(documentID: documentID ?? this.documentID, timestamp: timestamp ?? this.timestamp, appId: appId ?? this.appId, description: description ?? this.description, read: read ?? this.read, reporterId: reporterId ?? this.reporterId, assigneeId: assigneeId ?? this.assigneeId, status: status ?? this.status, );
  }

  @override
  int get hashCode => documentID.hashCode ^ timestamp.hashCode ^ appId.hashCode ^ description.hashCode ^ read.hashCode ^ reporterId.hashCode ^ assigneeId.hashCode ^ status.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is NotificationModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          timestamp == other.timestamp &&
          appId == other.appId &&
          description == other.description &&
          read == other.read &&
          reporterId == other.reporterId &&
          assigneeId == other.assigneeId &&
          status == other.status;

  @override
  String toString() {
    return 'NotificationModel{documentID: $documentID, timestamp: $timestamp, appId: $appId, description: $description, read: $read, reporterId: $reporterId, assigneeId: $assigneeId, status: $status}';
  }

  NotificationEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return NotificationEntity(
          timestamp: (timestamp == null) ? null : timestamp!.millisecondsSinceEpoch, 
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          read: (read != null) ? read : null, 
          reporterId: (reporterId != null) ? reporterId : null, 
          assigneeId: (assigneeId != null) ? assigneeId : null, 
          status: (status != null) ? status!.index : null, 
    );
  }

  static Future<NotificationModel?> fromEntity(String documentID, NotificationEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp == null ? null : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)), 
          appId: entity.appId ?? '', 
          description: entity.description, 
          read: entity.read, 
          reporterId: entity.reporterId, 
          assigneeId: entity.assigneeId, 
          status: toNotificationStatus(entity.status), 
    );
  }

  static Future<NotificationModel?> fromEntityPlus(String documentID, NotificationEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp == null ? null : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)), 
          appId: entity.appId ?? '', 
          description: entity.description, 
          read: entity.read, 
          reporterId: entity.reporterId, 
          assigneeId: entity.assigneeId, 
          status: toNotificationStatus(entity.status), 
    );
  }

}

