import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/profile/mobx/leaderboard_store.dart';
import 'package:rosseti/widgets/loading.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<LeaderboardStore>(
      builder: _scaffold,
      initFunction: (store) => store.init(),
      store: LeaderboardStore(),
    );
  }

  Widget _scaffold(BuildContext context, LeaderboardStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Доска лидеров"),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, LeaderboardStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return Card(
      elevation: 8,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: store.users.length + 1,
        itemBuilder: (context, index) => Row(
          children: [
            Text("${index == 0 ? '№' : index}"),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Text(
                    "${index == 0 ? 'ФИО' : store.users[index - 1].fullName}")),
            SizedBox(
              width: 8,
            ),
            Text("${index == 0 ? "Баллы" : store.users[index - 1].rating}"),
          ],
        ),
      ),
    );
  }
}
