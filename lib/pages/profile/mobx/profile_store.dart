import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/user.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore extends MobxBase with Store {
  final _userStore = InjectorService.getInjector.get<UserStore>();
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  User get user => _userStore.getUser;

  @override
  void dispose() {}

  void leadersTap() {
    _navigator.pushNamed(leadersPageRoute);
  }
}
