import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/pages/chat/mobx/new_theme_store.dart';
import 'package:rosseti/widgets/loading.dart';

class NewThemePage extends StatelessWidget {
  final Direction direction;

  const NewThemePage({Key key, this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<NewThemeStore>(
      builder: _scaffold,
      store: NewThemeStore(),
      initFunction: (store) => store.init(direction),
    );
  }

  Widget _scaffold(BuildContext context, NewThemeStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Создание темы"),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, NewThemeStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Выбранное направление: ${direction.name}"),
                  TextField(
                    controller: store.titleController,
                    decoration: InputDecoration(labelText: "Заголовок"),
                  ),
                  TextField(
                    controller: store.textController,
                    maxLines: 10,
                    minLines: 3,
                    decoration: InputDecoration(labelText: "Описание"),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: store.saveButtonPress,
            child: Text("Сохранить"),
          ),
        ],
      ),
    );
  }
}
