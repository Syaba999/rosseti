import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/chat/mobx/theme_store.dart';
import 'package:rosseti/widgets/loading.dart';

class ThemePage extends StatelessWidget {
  final String themeId;

  const ThemePage({Key key, this.themeId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<ThemeStore>(
      builder: _scaffold,
      initFunction: (store) => store.init(themeId),
      store: ThemeStore(),
    );
  }

  Widget _scaffold(BuildContext context, ThemeStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.theme == null ? "Тема" : store.theme.title),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, ThemeStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(store.theme.direction.name ?? ""),
                  Text(
                    store.theme.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(store.theme.text),
                  Text(
                    store.theme.user.fullName,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
        RaisedButton(
          child: Text("Открыть чат"),
          onPressed: store.openChat,
        )
      ],
    );
  }
}
