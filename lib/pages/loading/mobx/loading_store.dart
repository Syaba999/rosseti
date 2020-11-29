import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/services/socket_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'loading_store.g.dart';

class LoadingStore = _LoadingStore with _$LoadingStore;

abstract class _LoadingStore extends MobxBase with Store {
  @override
  void dispose() {}

  void init() async {
    InjectorService.setup();
    await InjectorService.getInjector.allReady();
    final navigator =
        InjectorService.getInjector.get<NavigatorService>().navigator;
    final userStore = InjectorService.getInjector.get<UserStore>();
    userStore.init();
    await Future.delayed(Duration(seconds: 2));
    if (userStore.getUser != null && userStore.getUser.id != null)
      await userStore.updateUser();
    InjectorService.getInjector.get<SocketService>().init();
    //navigator.popAndPushNamed(homePageRoute);
    if (userStore.getUser == null || userStore.getUser.id == null) {
      navigator.popAndPushNamed(loginPageRoute);
    } else {
      navigator.popAndPushNamed(homePageRoute);
      //navigator.popAndPushNamed(chatPageRoute);
    }
  }
}
