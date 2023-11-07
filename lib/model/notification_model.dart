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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_notifications/model/entity_export.dart';

import 'package:eliud_pkg_notifications/model/notification_entity.dart';

enum NotificationStatus { closed, open, unknown }

NotificationStatus toNotificationStatus(int? index) {
  switch (index) {
    case 0:
      return NotificationStatus.closed;
    case 1:
      return NotificationStatus.open;
  }
  return NotificationStatus.unknown;
}

class NotificationModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_notifications';
  static const String id = 'notifications';

  @override
  String documentID;
  DateTime? timestamp;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? description;
  bool? read;
  String? reporterId;
  String? assigneeId;
  NotificationStatus? status;

  NotificationModel({
    required this.documentID,
    this.timestamp,
    required this.appId,
    this.description,
    this.read,
    this.reporterId,
    this.assigneeId,
    this.status,
  });

  @override
  NotificationModel copyWith({
    String? documentID,
    DateTime? timestamp,
    String? appId,
    String? description,
    bool? read,
    String? reporterId,
    String? assigneeId,
    NotificationStatus? status,
  }) {
    return NotificationModel(
      documentID: documentID ?? this.documentID,
      timestamp: timestamp ?? this.timestamp,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      read: read ?? this.read,
      reporterId: reporterId ?? this.reporterId,
      assigneeId: assigneeId ?? this.assigneeId,
      status: status ?? this.status,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      timestamp.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      read.hashCode ^
      reporterId.hashCode ^
      assigneeId.hashCode ^
      status.hashCode;

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

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  @override
  NotificationEntity toEntity({String? appId}) {
    return NotificationEntity(
      timestamp: (timestamp == null) ? null : timestamp!.millisecondsSinceEpoch,
      appId: appId,
      description: (description != null) ? description : null,
      read: (read != null) ? read : null,
      reporterId: (reporterId != null) ? reporterId : null,
      assigneeId: (assigneeId != null) ? assigneeId : null,
      status: (status != null) ? status!.index : null,
    );
  }

  static Future<NotificationModel?> fromEntity(
      String documentID, NotificationEntity? entity) async {
    if (entity == null) return null;
    return NotificationModel(
      documentID: documentID,
      timestamp: entity.timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)),
      appId: entity.appId ?? '',
      description: entity.description,
      read: entity.read,
      reporterId: entity.reporterId,
      assigneeId: entity.assigneeId,
      status: toNotificationStatus(entity.status),
    );
  }

  static Future<NotificationModel?> fromEntityPlus(
      String documentID, NotificationEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return NotificationModel(
      documentID: documentID,
      timestamp: entity.timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)),
      appId: entity.appId ?? '',
      description: entity.description,
      read: entity.read,
      reporterId: entity.reporterId,
      assigneeId: entity.assigneeId,
      status: toNotificationStatus(entity.status),
    );
  }
}
