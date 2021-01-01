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



class NotificationModel {
  String documentID;
  String timestamp;

  // This is the identifier of the app to which this feed belongs
  String appId;
  String description;
  bool read;
  MemberModel from;
  String addresseeMemberId;

  NotificationModel({this.documentID, this.timestamp, this.appId, this.description, this.read, this.from, this.addresseeMemberId, })  {
    assert(documentID != null);
  }

  NotificationModel copyWith({String documentID, String timestamp, String appId, String description, bool read, MemberModel from, String addresseeMemberId, }) {
    return NotificationModel(documentID: documentID ?? this.documentID, timestamp: timestamp ?? this.timestamp, appId: appId ?? this.appId, description: description ?? this.description, read: read ?? this.read, from: from ?? this.from, addresseeMemberId: addresseeMemberId ?? this.addresseeMemberId, );
  }

  @override
  int get hashCode => documentID.hashCode ^ timestamp.hashCode ^ appId.hashCode ^ description.hashCode ^ read.hashCode ^ from.hashCode ^ addresseeMemberId.hashCode;

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
          from == other.from &&
          addresseeMemberId == other.addresseeMemberId;

  @override
  String toString() {
    return 'NotificationModel{documentID: $documentID, timestamp: $timestamp, appId: $appId, description: $description, read: $read, from: $from, addresseeMemberId: $addresseeMemberId}';
  }

  NotificationEntity toEntity({String appId}) {
    return NotificationEntity(
          timestamp: timestamp,           appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          read: (read != null) ? read : null, 
          fromId: (from != null) ? from.documentID : null, 
          addresseeMemberId: (addresseeMemberId != null) ? addresseeMemberId : null, 
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
          addresseeMemberId: entity.addresseeMemberId, 
    );
  }

  static Future<NotificationModel> fromEntityPlus(String documentID, NotificationEntity entity, { String appId}) async {
    if (entity == null) return null;

    MemberModel fromHolder;
    if (entity.fromId != null) {
      try {
        await memberRepository(appId: appId).get(entity.fromId).then((val) {
          fromHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return NotificationModel(
          documentID: documentID, 
          timestamp: entity.timestamp, 
          appId: entity.appId, 
          description: entity.description, 
          read: entity.read, 
          from: fromHolder, 
          addresseeMemberId: entity.addresseeMemberId, 
    );
  }

}

