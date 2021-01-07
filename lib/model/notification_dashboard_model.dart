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


import 'package:eliud_pkg_notifications/model/notification_dashboard_entity.dart';

import 'package:eliud_core/tools/random.dart';



class NotificationDashboardModel {
  String documentID;

  // This is the identifier of the app to which this feed belongs
  String appId;
  String description;

  NotificationDashboardModel({this.documentID, this.appId, this.description, })  {
    assert(documentID != null);
  }

  NotificationDashboardModel copyWith({String documentID, String appId, String description, }) {
    return NotificationDashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is NotificationDashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description;

  @override
  String toString() {
    return 'NotificationDashboardModel{documentID: $documentID, appId: $appId, description: $description}';
  }

  NotificationDashboardEntity toEntity({String appId}) {
    return NotificationDashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
    );
  }

  static NotificationDashboardModel fromEntity(String documentID, NotificationDashboardEntity entity) {
    if (entity == null) return null;
    return NotificationDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
    );
  }

  static Future<NotificationDashboardModel> fromEntityPlus(String documentID, NotificationDashboardEntity entity, { String appId}) async {
    if (entity == null) return null;

    return NotificationDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
    );
  }

}
