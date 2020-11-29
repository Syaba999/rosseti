import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/widgets/loading.dart';

import 'mobx/theme_list_store.dart';

class ThemeListPage extends StatelessWidget {
  final Direction direction;

  const ThemeListPage({Key key, this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<ThemeListStore>(
      store: ThemeListStore(),
      builder: _scaffold,
      initFunction: (store) => store.init(direction),
    );
  }

  Widget _scaffold(BuildContext context, ThemeListStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.direction?.name ?? ""),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.addButtonPress,
        child: Icon(Icons.add),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, ThemeListStore store) {
    if (store.isLoading) {
      return Loading();
    }
    if (store.direction.themes == null || store.direction.themes.isEmpty) {
      return Center(
        child: Text("Список тем пуст"),
      );
    }
    return ListView.builder(
      itemCount: store.direction.themes.length + 1,
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Выберите тему:",
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : Card(
              child: InkWell(
                onTap: () =>
                    store.onThemeTap(store.direction.themes[index - 1]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.direction.themes[index - 1].title ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        store.direction.themes[index - 1].user.fullName,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
