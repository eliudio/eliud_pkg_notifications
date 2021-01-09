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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class NotificationDashboardJsFirestore implements NotificationDashboardRepository {
  Future<NotificationDashboardModel> add(NotificationDashboardModel value) {
    return notificationDashboardCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(NotificationDashboardModel value) {
    return notificationDashboardCollection.doc(value.documentID).delete();
  }

  Future<NotificationDashboardModel> update(NotificationDashboardModel value) {
    return notificationDashboardCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  NotificationDashboardModel _populateDoc(DocumentSnapshot value) {
    return NotificationDashboardModel.fromEntity(value.id, NotificationDashboardEntity.fromMap(value.data()));
  }

  Future<NotificationDashboardModel> _populateDocPlus(DocumentSnapshot value) async {
    return NotificationDashboardModel.fromEntityPlus(value.id, NotificationDashboardEntity.fromMap(value.data()), appId: appId);
  }

  Future<NotificationDashboardModel> get(String id, { Function(Exception) onError }) {
    return notificationDashboardCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    }).catchError((Object e) {
      if (onError != null) {
        onError(e);
      }
    });
  }

  @override
  StreamSubscription<List<NotificationDashboardModel>> listen(NotificationDashboardModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    var stream;
    stream = getQuery(getCollection(), currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).onSnapshot
        .map((data) {
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

  StreamSubscription<List<NotificationDashboardModel>> listenWithDetails(NotificationDashboardModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    var stream;
    // If we use notificationDashboardCollection here, then the second subscription fails
    stream = getQuery(getCollection(), currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });
    return stream.listen((listOfNotificationDashboardModels) {
      trigger(listOfNotificationDashboardModels);
    });
  }

  @override
  StreamSubscription<NotificationDashboardModel> listenTo(String documentId, NotificationDashboardChanged changed) {
    var stream = getCollection().doc(documentId)
        .onSnapshot
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<NotificationDashboardModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationDashboardModel>> _values = getQuery(notificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<NotificationDashboardModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationDashboardModel>> _values = getQuery(notificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)
      .onSnapshot
      .asyncMap((data) {
        return Future.wait(data.docs.map((doc) { 
          lastDoc = doc;
          return _populateDocPlus(doc);
        }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<NotificationDashboardModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<NotificationDashboardModel> _values = await getQuery(notificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<NotificationDashboardModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<NotificationDashboardModel> _values = await getQuery(notificationDashboardCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {  
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return notificationDashboardCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => notificationDashboardCollection.doc(element.id).delete()));
  }
  
  dynamic getSubCollection(String documentId, String name) {
    return notificationDashboardCollection.doc(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 
  final String appId;
  NotificationDashboardJsFirestore(this.notificationDashboardCollection, this.appId);

  // In flutterweb, it seems we require to re-retrieve the collection. If not then subscribing / listening to it a second time fails.
  // CollectionReference getCollection() => notificationDashboardCollection;
  CollectionReference getCollection() => appRepository().getSubCollection(appId, 'notificationdashboard');
  final CollectionReference notificationDashboardCollection;
}

