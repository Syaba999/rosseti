import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/models/chat_theme.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore extends MobxBase with Store {
  @override
  void dispose() {}

  ChatTheme theme;

  void init(String themeId) async {
    toLoadingState();
    try {
      theme = await ApiRequests.fetchChatTheme(themeId);
      toSuccessState();
    } catch (error) {
      print(error);
    }
  }
}
