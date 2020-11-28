import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'new_theme_store.g.dart';

class NewThemeStore = _NewThemeStore with _$NewThemeStore;

abstract class _NewThemeStore extends MobxBase with Store {
  final _userStore = InjectorService.getInjector.get<UserStore>();
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  @override
  void dispose() {}

  TextEditingController titleController;
  TextEditingController textController;

  Direction _direction;

  void init(Direction direction) {
    _direction = direction;
    titleController = TextEditingController();
    textController = TextEditingController();
  }

  void saveButtonPress() async {
    if (titleController.text.isNotEmpty && textController.text.isNotEmpty) {
      toLoadingState();
      try {
        final themeId = await ApiRequests.createChatTheme(titleController.text,
            textController.text, _userStore.getUser.id, _direction.id);
        _navigator.popAndPushNamed(themePageRoute, arguments: themeId);
      } catch (error) {
        print(error);
      }
    }
  }
}
