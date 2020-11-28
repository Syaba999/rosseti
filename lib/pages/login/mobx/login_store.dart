import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  @override
  void dispose() {}

  TextEditingController mailController;
  TextEditingController passwordController;

  void init() {
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void loginButtonPress() async {
    if (mailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      //TODO LOGIN REQ
      toLoadingState();
      await Future.delayed(Duration(seconds: 1));
      _navigator.popAndPushNamed(userInfoPageRoute);
    }
  }
}
