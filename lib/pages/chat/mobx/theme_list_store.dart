import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/chat_theme.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';

part 'theme_list_store.g.dart';

class ThemeListStore = _ThemeListStore with _$ThemeListStore;

abstract class _ThemeListStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;
  @override
  void dispose() {}

  Direction _direction;

  void init(Direction direction) {
    _direction = direction;
  }

  void addButtonPress() {
    _navigator.pushNamed(newThemePageRoute, arguments: _direction);
  }

  void onThemeTap(ChatTheme theme) {
    _navigator.pushNamed(themePageRoute, arguments: theme.id);
  }
}
