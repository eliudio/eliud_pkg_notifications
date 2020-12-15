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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_notifications/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_notifications/model/entity_export.dart';



import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class NotificationJsFirestore implements NotificationRepository {
  Future<NotificationModel> add(NotificationModel value) {
    return notificationCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).copyWith(timestamp : FieldValue.serverTimestamp(), ).toDocument())
        .then((_) => value).then((v) => get(value.documentID));
  }

  Future<void> delete(NotificationModel value) {
    return notificationCollection.doc(value.documentID).delete();
  }

  Future<NotificationModel> update(NotificationModel value) {
    return notificationCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).copyWith(timestamp : FieldValue.serverTimestamp(), ).toDocument())
        .then((_) => value).then((v) => get(value.documentID));
  }

  NotificationModel _populateDoc(DocumentSnapshot value) {
    return NotificationModel.fromEntity(value.id, NotificationEntity.fromMap(value.data()));
  }

  Future<NotificationModel> _populateDocPlus(DocumentSnapshot value) async {
    return NotificationModel.fromEntityPlus(value.id, NotificationEntity.fromMap(value.data()), appId: appId);
  }

  Future<NotificationModel> get(String id) {
    return notificationCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<NotificationModel>> listen(NotificationModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<NotificationModel> notifications  = data.docs.map((doc) {
          NotificationModel value = _populateDoc(doc);
          return value;
        }).toList();
        return notifications;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<NotificationModel> notifications  = data.docs.map((doc) {
          NotificationModel value = _populateDoc(doc);
          return value;
        }).toList();
        return notifications;
      });
    }
    return stream.listen((listOfNotificationModels) {
      trigger(listOfNotificationModels);
    });
  }

  StreamSubscription<List<NotificationModel>> listenWithDetails(NotificationModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    var stream;
    if (orderBy == null) {
      // If we use notificationCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use notificationCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfNotificationModels) {
      trigger(listOfNotificationModels);
    });
  }

  Stream<List<NotificationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationModel>> _values = getQuery(notificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<NotificationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<NotificationModel>> _values = getQuery(notificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit)
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
  Future<List<NotificationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<NotificationModel> _values = await getQuery(notificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).get().then((value) {
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
  Future<List<NotificationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<NotificationModel> _values = await getQuery(notificationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).get().then((value) {
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
    return notificationCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => notificationCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Notification-$appId');

  final String appId;
  
  NotificationJsFirestore(this.appId) : notificationCollection = firestore().collection('Notification-$appId');

  final CollectionReference notificationCollection;
}
