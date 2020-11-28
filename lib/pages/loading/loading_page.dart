import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/loading/mobx/loading_store.dart';
import 'package:rosseti/widgets/loading.dart';
import 'package:rosseti/widgets/logo.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<LoadingStore>(
      builder: _content,
      store: LoadingStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _content(BuildContext context, LoadingStore store) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          SizedBox(
            height: 100,
          ),
          Loading()
        ],
      ),
    );
  }
}
