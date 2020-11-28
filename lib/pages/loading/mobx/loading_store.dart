import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/api_client.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/data_store.dart';

part 'loading_store.g.dart';

class LoadingStore = _LoadingStore with _$LoadingStore;

abstract class _LoadingStore extends MobxBase with Store {
  @override
  void dispose() {}

  void init() async {
    InjectorService.setup();
    await InjectorService.getInjector.allReady();
    InjectorService.getInjector.get<ApiClient>().init();
    final navigator =
        InjectorService.getInjector.get<NavigatorService>().navigator;
    InjectorService.getInjector.get<DataStore>().init();
    await Future.delayed(Duration(seconds: 2));
    //navigator.popAndPushNamed(loginPageRoute);
    navigator.popAndPushNamed(homePageRoute);
  }
}
