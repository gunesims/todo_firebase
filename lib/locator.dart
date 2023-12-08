import 'package:get_it/get_it.dart';
import 'package:todo_firebase/core/api/firestore_api.dart';

final locator = GetIt.I;

void setup() {
  locator.registerLazySingleton(() => FirestoreApi());
}
