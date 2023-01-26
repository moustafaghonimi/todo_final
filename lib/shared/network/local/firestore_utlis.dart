import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/task.dart';

CollectionReference<Tasks> getTaskCollection() {
  return FirebaseFirestore.instance.collection('Tasks').withConverter<Tasks>(
        fromFirestore: (snapshot, options) => Tasks.fromjson(snapshot.data()!),
        toFirestore: (value, options) => value.tojson(),
      );
}

Future<void> addTaskToFirestore(Tasks task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();

    task.id = docRef.id;

  return docRef.set(task);
}

Stream<QuerySnapshot<Tasks>> getDataFromFirestore(DateTime dateTime) {
  return getTaskCollection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteItemFromFireStore(String id){
  return getTaskCollection().doc(id).delete();
}

