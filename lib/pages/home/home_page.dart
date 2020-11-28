import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/chat/widgets/direction_list.dart';
import 'package:rosseti/pages/home/mobx/home_store.dart';
import 'package:rosseti/pages/home/widgets/bottom_navigation.dart';
import 'package:rosseti/pages/proposal/proposal_list_page.dart';
import 'package:rosseti/widgets/loading.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<HomeStore>(
      builder: _scaffold,
      store: HomeStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _scaffold(BuildContext context, HomeStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Россети"),
      ),
      body: _content(context, store),
      bottomNavigationBar: BottomNavigation(
        onItemTapped: store.onMenuItemTap,
        selectedIndex: store.selectedMenu,
      ),
    );
  }

  Widget _content(BuildContext context, HomeStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return _pageList[store.selectedMenu];
  }

  final List<Widget> _pageList = [
    ProposalListPage(),
    DirectionList(),
  ];
}
