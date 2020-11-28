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
        title: Text(direction.name),
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
    if (direction.themes == null || direction.themes.isEmpty) {
      return Center(
        child: Text("Список тем пуст"),
      );
    }
    return ListView.builder(
      itemCount: direction.themes.length + 1,
      itemBuilder: (context, index) => index == 0
          ? Text("Выберите тему:")
          : Card(
              child: InkWell(
                onTap: () => store.onThemeTap(direction.themes[index]),
                child: Text(direction.themes[index].title),
              ),
            ),
    );
  }
}
