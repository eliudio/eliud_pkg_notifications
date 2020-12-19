/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';


import 'package:eliud_pkg_notifications/model/dashboard_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DashboardModel {
  String documentID;

  // This is the identifier of the app to which this feed belongs
  String appId;
  String description;

  DashboardModel({this.documentID, this.appId, this.description, })  {
    assert(documentID != null);
  }

  DashboardModel copyWith({String documentID, String appId, String description, }) {
    return DashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description;

  @override
  String toString() {
    return 'DashboardModel{documentID: $documentID, appId: $appId, description: $description}';
  }

  DashboardEntity toEntity({String appId}) {
    return DashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
    );
  }

  static DashboardModel fromEntity(String documentID, DashboardEntity entity) {
    if (entity == null) return null;
    return DashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
    );
  }

  static Future<DashboardModel> fromEntityPlus(String documentID, DashboardEntity entity, { String appId}) async {
    if (entity == null) return null;

    return DashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
    );
  }

}

