part of 'task_cubit.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskError extends TaskState {
  final String message;

  TaskError({required this.message});
}

class TaskSuccess extends TaskState {
  final String message;

  TaskSuccess({required this.message});
}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskEntity> listOfData;

  TaskLoaded({required this.listOfData});
}

class TaskSaved extends TaskState {}

class TaskDeleted extends TaskState {}
