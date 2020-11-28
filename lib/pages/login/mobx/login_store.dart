import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;
  final _userStore = InjectorService.getInjector.get<UserStore>();

  List<String> errors;

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
      toLoadingState();
      final user =
          await ApiRequests.login(mailController.text, passwordController.text)
              .catchError((e) {
        errors = e as List<String>;
        toErrorState();
      });
      _userStore.setUser(user);
      _navigator.popAndPushNamed(homePageRoute);
    }
  }
}
