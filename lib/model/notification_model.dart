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


import 'package:eliud_pkg_notifications/model/notification_entity.dart';

import 'package:eliud_core/tools/random.dart';



class NotificationModel {
  String documentID;
  DateTime timestamp;

  // This is the identifier of the app to which this feed belongs
  String appId;
  String description;
  bool read;
  MemberModel addressee;

  // If  this results in some action, then specify here
  ActionModel action;

  NotificationModel({this.documentID, this.timestamp, this.appId, this.description, this.read, this.addressee, this.action, })  {
    assert(documentID != null);
  }

  NotificationModel copyWith({String documentID, DateTime timestamp, String appId, String description, bool read, MemberModel addressee, ActionModel action, }) {
    return NotificationModel(documentID: documentID ?? this.documentID, timestamp: timestamp ?? this.timestamp, appId: appId ?? this.appId, description: description ?? this.description, read: read ?? this.read, addressee: addressee ?? this.addressee, action: action ?? this.action, );
  }

  @override
  int get hashCode => documentID.hashCode ^ timestamp.hashCode ^ appId.hashCode ^ description.hashCode ^ read.hashCode ^ addressee.hashCode ^ action.hashCode;

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
          addressee == other.addressee &&
          action == other.action;

  @override
  String toString() {
    return 'NotificationModel{documentID: $documentID, timestamp: $timestamp, appId: $appId, description: $description, read: $read, addressee: $addressee, action: $action}';
  }

  NotificationEntity toEntity({String appId}) {
    return NotificationEntity(
          timestamp: timestamp,           appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          read: (read != null) ? read : null, 
          addresseeId: (addressee != null) ? addressee.documentID : null, 
          action: (action != null) ? action.toEntity(appId: appId) : null, 
    );
  }

  static NotificationModel fromEntity(String documentID, NotificationEntity entity) {
    if (entity == null) return null;
    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp, 
          appId: entity.appId, 
          description: entity.description, 
          read: entity.read, 
          action: 
            ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<NotificationModel> fromEntityPlus(String documentID, NotificationEntity entity, { String appId}) async {
    if (entity == null) return null;

    MemberModel addresseeHolder;
    if (entity.addresseeId != null) {
      try {
        await memberRepository(appId: appId).get(entity.addresseeId).then((val) {
          addresseeHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp, 
          appId: entity.appId, 
          description: entity.description, 
          read: entity.read, 
          addressee: addresseeHolder, 
          action: 
            await ActionModel.fromEntityPlus(entity.action, appId: appId), 
    );
  }

}

