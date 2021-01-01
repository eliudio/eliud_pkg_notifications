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
  final String fromId;
  final String addresseeMemberId;

  NotificationEntity({this.timestamp, this.appId, this.description, this.read, this.fromId, this.addresseeMemberId, });

  NotificationEntity copyWith({Object timestamp, }) {
    return NotificationEntity(timestamp : timestamp, appId: appId, description: description, read: read, fromId: fromId, addresseeMemberId: addresseeMemberId, );
  }
  List<Object> get props => [timestamp, appId, description, read, fromId, addresseeMemberId, ];

  @override
  String toString() {
    return 'NotificationEntity{timestamp: $timestamp, appId: $appId, description: $description, read: $read, fromId: $fromId, addresseeMemberId: $addresseeMemberId}';
  }

  static NotificationEntity fromMap(Map map) {
    if (map == null) return null;

    return NotificationEntity(
      timestamp: notificationRepository().timeStampToString(map['timestamp']), 
      appId: map['appId'], 
      description: map['description'], 
      read: map['read'], 
      fromId: map['fromId'], 
      addresseeMemberId: map['addresseeMemberId'], 
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
    if (fromId != null) theDocument["fromId"] = fromId;
      else theDocument["fromId"] = null;
    if (addresseeMemberId != null) theDocument["addresseeMemberId"] = addresseeMemberId;
      else theDocument["addresseeMemberId"] = null;
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

