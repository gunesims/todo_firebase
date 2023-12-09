import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/core/api/firestore_api.dart';

import '../entity/task_entity.dart';
import '../utils/firestore_constants.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final FirestoreApi firestoreApi;
  List<TaskEntity> listOfTask = [];
  TaskCubit({required this.firestoreApi}) : super(TaskInitial());

  void fetchTask() async {
    emit(TaskLoading());
    try {
      listOfTask =
          await firestoreApi.get(collection: FirestoreConstants.tTasks);
      emit(TaskLoaded(listOfData: listOfTask));
    } catch (error) {
      emit(TaskError(message: 'Error...'));
    }
  }

  void createTask(TaskEntity taskEntity) async {
    try {
      await firestoreApi.post(
          taskEntity: taskEntity, collection: FirestoreConstants.tTasks);
      listOfTask.add(taskEntity);
      emit(TaskSuccess(message: "Task created!"));
      emit(TaskLoaded(listOfData: listOfTask));
    } catch (error) {
      emit(TaskError(message: 'Error...'));
    }
  }

  void deleteTask(String id) async {
    try {
      await firestoreApi.delete(id: id, collection: FirestoreConstants.tTasks);
      listOfTask.removeWhere((element) => element.id == id);
      emit(TaskSuccess(message: "Task deleted!"));
      emit(TaskLoaded(listOfData: listOfTask));
    } catch (error) {
      emit(TaskError(message: 'Error...'));
    }
  }

  void updateTask(){

  }
}
