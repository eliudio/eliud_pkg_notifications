/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_notifications/model/notification_dashboard_repository.dart';


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

class NotificationDashboardFirestore implements NotificationDashboardRepository {
  Future<NotificationDashboardModel> add(NotificationDashboardModel value) {
    return NotificationDashboardCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(NotificationDashboardModel value) {
    return NotificationDashboardCollection.doc(value.documentID).delete();
  }

  Future<NotificationDashboardModel> update(NotificationDashboardModel value) {
    return NotificationDashboardCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  NotificationDashboardModel _populateDoc(DocumentSnapshot value) {
    return NotificationDashboardModel.fromEntity(value.id, NotificationDashboardEntity.fromMap(value.data()));
  }

  Future<NotificationDashboardModel> _populateDocPlus(DocumentSnapshot value) async {
    return NotificationDashboardModel.fromEntityPlus(value.id, NotificationDashboardEntity.fromMap(value.data()), appId: appId);  }

  Future<NotificationDashboardModel> get(String id, {Function(Exception) onError}) {
    return NotificationDashboardCollection.doc(id).get().then((doc) {
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

  StreamSubscription<List<NotificationDashboardModel>> listen(NotificationDashboardModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<NotificationDashboardModel>> stream;
    stream = getQuery(NotificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
      Iterable<NotificationDashboardModel> notificationDashboards  = data.docs.map((doc) {
        NotificationDashboardModel value = _populateDoc(doc);
        return value;
      }).toList();
      return notificationDashboards;
    });
    return stream.listen((listOfNotificationDashboardModels) {
      trigger(listOfNotificationDashboardModels);
    });
  }

  StreamSubscription<List<NotificationDashboardModel>> listenWithDetails(NotificationDashboardModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<NotificationDashboardModel>> stream;
    stream = getQuery(NotificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfNotificationDashboardModels) {
      trigger(listOfNotificationDashboardModels);
    });
  }

  @override
  StreamSubscription<NotificationDashboardModel> listenTo(String documentId, NotificationDashboardChanged changed) {
    var stream = NotificationDashboardCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<NotificationDashboardModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationDashboardModel>> _values = getQuery(NotificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<NotificationDashboardModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationDashboardModel>> _values = getQuery(NotificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<NotificationDashboardModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<NotificationDashboardModel> _values = await getQuery(NotificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<NotificationDashboardModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<NotificationDashboardModel> _values = await getQuery(NotificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
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
    return NotificationDashboardCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return NotificationDashboardCollection.doc(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  final String appId;
  NotificationDashboardFirestore(this.NotificationDashboardCollection, this.appId);

  final CollectionReference NotificationDashboardCollection;
}

