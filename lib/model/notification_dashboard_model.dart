/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';

import 'package:eliud_pkg_notifications/model/notification_dashboard_entity.dart';

class NotificationDashboardModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_notifications';
  static const String id = 'notificationDashboards';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? description;
  StorageConditionsModel? conditions;

  NotificationDashboardModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.conditions,
  });

  @override
  NotificationDashboardModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    StorageConditionsModel? conditions,
  }) {
    return NotificationDashboardModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDashboardModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'NotificationDashboardModel{documentID: $documentID, appId: $appId, description: $description, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  NotificationDashboardEntity toEntity({String? appId}) {
    return NotificationDashboardEntity(
      appId: appId,
      description: (description != null) ? description : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<NotificationDashboardModel?> fromEntity(
      String documentID, NotificationDashboardEntity? entity) async {
    if (entity == null) return null;
    return NotificationDashboardModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<NotificationDashboardModel?> fromEntityPlus(
      String documentID, NotificationDashboardEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return NotificationDashboardModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
