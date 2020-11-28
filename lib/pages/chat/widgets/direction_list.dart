import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/chat/mobx/direction_list_store.dart';

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
    return ListView.builder(
      itemCount: store.directions.length,
      itemBuilder: (context, index) => _listBuilder(context, index, store),
    );
  }

  Widget _listBuilder(
      BuildContext context, int index, DirectionListStore store) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(store.directions[index]),
      ),
    );
  }
}
