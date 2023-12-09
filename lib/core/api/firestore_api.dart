import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/core/entity/task_entity.dart';

class FirestoreApi {
  FirebaseFirestore api = FirebaseFirestore.instance;

  Future<List<TaskEntity>> get({required String collection}) async {
    List<TaskEntity> listOfData = [];

    QuerySnapshot<Map<String, dynamic>> data =
        await api.collection(collection).get();

    for (var element in data.docs) {
      final json = element.data();
      listOfData.add(TaskEntity.fromJson(json));
    }

    debugPrint("Count tasks of list: ${listOfData.length}");

    return listOfData;
  }

  post({required TaskEntity taskEntity, required String collection}) async {
    await api
        .collection(collection)
        .doc(taskEntity.id)
        .set(taskEntity.toJson());
  }



  delete({required String id, required String collection}) async {
    await api.collection(collection).doc(id).delete();
  }
}
