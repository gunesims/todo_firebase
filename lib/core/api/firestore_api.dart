import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/core/entity/task_entity.dart';
import 'package:todo_firebase/core/utils/firestore_constants.dart';

class FirestoreApi {
  FirebaseFirestore api = FirebaseFirestore.instance;

  Future<List<TaskEntity>> get() async {
    List<TaskEntity> listOfData = [];

    QuerySnapshot<Map<String, dynamic>> data =
        await api.collection(FirestoreConstants.tTasks).get();

    for (var element in data.docs) {
      listOfData.add(TaskEntity.fromJson(element as Map<String, dynamic>));
    }

    return listOfData;
  }

  post(TaskEntity taskEntity) async {
    await api
        .collection(FirestoreConstants.tTasks)
        .doc(taskEntity.id)
        .set(taskEntity.toJson());
  }

  delete(TaskEntity taskEntity) async {
    await api.collection(FirestoreConstants.tTasks).doc(taskEntity.id).delete();
  }
}
