import 'package:get_it/get_it.dart';
import 'package:todo_firebase/core/api/firestore_api.dart';

import 'core/cubits/task_cubit.dart';

final locator = GetIt.I;

void setup() {
  //classes
  locator.registerLazySingleton(() => FirestoreApi());
  //cubits
  locator.registerFactory(() => TaskCubit(firestoreApi: locator()));
}
