import 'package:get_it/get_it.dart';
import 'package:nucleus/shared/core/local_storage.dart';
import 'package:nucleus/shared/core/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initFeatures();
  await initExternal();
}

void initFeatures() {
  // sl.registerLazySingleton(() => null)
}

Future<void> initExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(
    () => LocalStorage(sl()),
  );
  sl.registerLazySingleton(
    () => RestClient(sl()),
  );
  // sl.registerLazySingleton(() => null)
}
