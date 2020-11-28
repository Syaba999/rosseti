import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/chat/mobx/direction_list_store.dart';
import 'package:rosseti/widgets/loading.dart';

class DirectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<DirectionListStore>(
      builder: _content,
      store: DirectionListStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _content(BuildContext context, DirectionListStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return ListView.builder(
      itemCount: store.directions.length + 1,
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Выберите направление:",
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : _listBuilder(context, index - 1, store),
    );
  }

  Widget _listBuilder(
      BuildContext context, int index, DirectionListStore store) {
    return Card(
      child: InkWell(
        onTap: () => store.selectDirection(store.directions[index]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(store.directions[index].name),
        ),
      ),
    );
  }
}
