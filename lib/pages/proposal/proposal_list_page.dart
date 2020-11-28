import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/proposal/mobx/proposal_list_store.dart';
import 'package:rosseti/pages/proposal/widgets/proposal_list_item.dart';
import 'package:rosseti/widgets/loading.dart';

class ProposalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<ProposalListStore>(
      builder: _scaffold,
      store: ProposalListStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _scaffold(BuildContext context, ProposalListStore store) {
    return Scaffold(
      body: _content(context, store),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: store.newProposalButtonPress,
      ),
    );
  }

  Widget _content(BuildContext context, ProposalListStore store) {
    if (store.isLoading) {
      return Loading();
    }
    final axisCount = MediaQuery.of(context).size.width ~/ 300;
    if (Platform.isAndroid || Platform.isIOS || axisCount < 2) {
      return ListView.builder(
        itemCount: store.proposalList.length,
        itemBuilder: (context, index) => ProposalListItem(
          proposal: store.proposalList[index],
          onTap: store.onProposalTap,
        ),
      );
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: axisCount > 0 ? axisCount : 1),
      itemCount: store.proposalList.length,
      itemBuilder: (context, index) => ProposalListItem(
        proposal: store.proposalList[index],
        onTap: store.onProposalTap,
      ),
    );
  }
}
