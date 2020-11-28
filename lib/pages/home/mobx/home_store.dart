import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore extends MobxBase with Store {
  @override
  void dispose() {}

  void init() {}

  @observable
  int selectedMenu = 0;

  @action
  void onMenuItemTap(int index) {
    selectedMenu = index;
  }
}
