/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_notifications/model/notification_repository.dart';


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


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class NotificationFirestore implements NotificationRepository {
  Future<NotificationModel> add(NotificationModel value) {
    return NotificationCollection.doc(value.documentID).set(value.toEntity(appId: appId).copyWith(timestamp : FieldValue.serverTimestamp(), ).toDocument()).then((_) => value).then((v) => get(value.documentID));
  }

  Future<void> delete(NotificationModel value) {
    return NotificationCollection.doc(value.documentID).delete();
  }

  Future<NotificationModel> update(NotificationModel value) {
    return NotificationCollection.doc(value.documentID).update(value.toEntity(appId: appId).copyWith(timestamp : FieldValue.serverTimestamp(), ).toDocument()).then((_) => value).then((v) => get(value.documentID));
  }

  NotificationModel _populateDoc(DocumentSnapshot value) {
    return NotificationModel.fromEntity(value.id, NotificationEntity.fromMap(value.data()));
  }

  Future<NotificationModel> _populateDocPlus(DocumentSnapshot value) async {
    return NotificationModel.fromEntityPlus(value.id, NotificationEntity.fromMap(value.data()), appId: appId);  }

  Future<NotificationModel> get(String id, {Function(Exception) onError}) {
    return NotificationCollection.doc(id).get().then((doc) {
      if (doc.data() != null)
        return _populateDocPlus(doc);
      else
        return null;
    }).catchError((Object e) {
      if (onError != null) {
        onError(e);
      }
    });
  }

  StreamSubscription<List<NotificationModel>> listen(NotificationModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<NotificationModel>> stream;
    stream = getQuery(NotificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
      Iterable<NotificationModel> notifications  = data.docs.map((doc) {
        NotificationModel value = _populateDoc(doc);
        return value;
      }).toList();
      return notifications;
    });
    return stream.listen((listOfNotificationModels) {
      trigger(listOfNotificationModels);
    });
  }

  StreamSubscription<List<NotificationModel>> listenWithDetails(NotificationModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<NotificationModel>> stream;
    stream = getQuery(NotificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfNotificationModels) {
      trigger(listOfNotificationModels);
    });
  }

  @override
  StreamSubscription<NotificationModel> listenTo(String documentId, NotificationChanged changed) {
    var stream = NotificationCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<NotificationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationModel>> _values = getQuery(NotificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<NotificationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationModel>> _values = getQuery(NotificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<NotificationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<NotificationModel> _values = await getQuery(NotificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<NotificationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<NotificationModel> _values = await getQuery(NotificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return NotificationCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return NotificationCollection.doc(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  final String appId;
  NotificationFirestore(this.NotificationCollection, this.appId);

  final CollectionReference NotificationCollection;
}

