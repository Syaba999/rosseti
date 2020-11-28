import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';

part 'direction_list_store.g.dart';

class DirectionListStore = _DirectionListStore with _$DirectionListStore;

abstract class _DirectionListStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  @override
  void dispose() {}

  List<Direction> directions;

  void init() async {
    toLoadingState();
    try {
      directions = await ApiRequests.fetchDirectionList();
      toSuccessState();
    } catch (error) {
      print(error);
    }
  }

  void selectDirection(Direction direction) {
    _navigator.pushNamed(themeListPageRoute, arguments: direction);
  }
}
