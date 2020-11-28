import 'package:get_it/get_it.dart';
import 'package:rosseti/api/api_auth_client.dart';
import 'package:rosseti/api/api_client.dart';
import 'package:rosseti/data/persistent/persistent_data_source.dart';
import 'package:rosseti/pages/proposal/mobx/proposal_list_store.dart';
import 'package:rosseti/store/user_store.dart';

import 'navigator_service.dart';

abstract class InjectorService {
  static final _injector = GetIt.instance;
  static GetIt get getInjector => _injector;

  static void setup() {
    _injector.registerSingletonAsync(
        () async => await PersistentDataSource.create());
    _injector.registerLazySingleton(() => ApiClient.init());
    _injector.registerLazySingleton(() => ApiAuthClient.init());
    _injector.registerLazySingleton(() => UserStore());
    _injector.registerLazySingleton(() => ProposalListStore());
  }

  static void setupNavigator() {
    _injector.registerLazySingleton(() => NavigatorService());
  }
}
