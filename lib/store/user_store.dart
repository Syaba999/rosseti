import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/data/persistent/persistent_data_source.dart';
import 'package:rosseti/models/user.dart';
import 'package:rosseti/services/injector_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore extends MobxBase with Store {
  final _prefs = InjectorService.getInjector.get<PersistentDataSource>();
  @override
  void dispose() {}

  User _user;

  User get getUser => _user;

  void init() {
    _user = _prefs.getUser();
  }

  void setUser(User user) {
    _prefs.setUser(user);
    _user = user;
  }
}
