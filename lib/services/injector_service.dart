import 'package:get_it/get_it.dart';
import 'package:rosseti/api/api_client.dart';
import 'package:rosseti/store/data_store.dart';

import 'navigator_service.dart';

abstract class InjectorService {
  static GetIt getInjector = GetIt.instance;

  static void setup() {
    getInjector.registerLazySingleton(() => ApiClient());
    getInjector.registerLazySingleton(() => DataStore());
  }

  static void setupNavigator() {
    getInjector.registerLazySingleton(() => NavigatorService());
  }
}
