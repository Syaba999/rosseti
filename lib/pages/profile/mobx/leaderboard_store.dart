import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/models/user.dart';

part 'leaderboard_store.g.dart';

class LeaderboardStore = _LeaderboardStore with _$LeaderboardStore;

abstract class _LeaderboardStore extends MobxBase with Store {
  @override
  void dispose() {}

  List<User> users;

  void init() async {
    toLoadingState();
    users = await ApiRequests.fetchUserList();
    users.sort((a, b) => b.rating.compareTo(a.rating));
    toSuccessState();
  }
}
