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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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


class NotificationModel {
  String? documentID;
  String? timestamp;

  // This is the identifier of the app to which this feed belongs
  String? appId;
  String? description;
  bool? read;
  String? reporterId;
  String? assigneeId;
  NotificationStatus? status;

  NotificationModel({this.documentID, this.timestamp, this.appId, this.description, this.read, this.reporterId, this.assigneeId, this.status, })  {
    assert(documentID != null);
  }

  NotificationModel copyWith({String? documentID, String? timestamp, String? appId, String? description, bool? read, String? reporterId, String? assigneeId, NotificationStatus? status, }) {
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

  NotificationEntity toEntity({String? appId}) {
    return NotificationEntity(
          timestamp: timestamp, 
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          read: (read != null) ? read : null, 
          reporterId: (reporterId != null) ? reporterId : null, 
          assigneeId: (assigneeId != null) ? assigneeId : null, 
          status: (status != null) ? status!.index : null, 
    );
  }

  static NotificationModel? fromEntity(String documentID, NotificationEntity? entity) {
    if (entity == null) return null;
    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp.toString(),
          appId: entity.appId, 
          description: entity.description, 
          read: entity.read, 
          reporterId: entity.reporterId, 
          assigneeId: entity.assigneeId, 
          status: toNotificationStatus(entity.status), 
    );
  }

  static Future<NotificationModel?> fromEntityPlus(String documentID, NotificationEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp, 
          appId: entity.appId, 
          description: entity.description, 
          read: entity.read, 
          reporterId: entity.reporterId, 
          assigneeId: entity.assigneeId, 
          status: toNotificationStatus(entity.status), 
    );
  }

}

