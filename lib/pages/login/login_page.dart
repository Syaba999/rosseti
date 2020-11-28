import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/login/mobx/login_store.dart';
import 'package:rosseti/widgets/loading.dart';
import 'package:rosseti/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<LoginStore>(
      builder: _content,
      store: LoginStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _content(BuildContext context, LoginStore store) {
    return Scaffold(
      body: store.isLoading
          ? Loading()
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Logo(),
                    Container(
                      width: !Platform.isIOS || !Platform.isAndroid
                          ? 400
                          : double.maxFinite,
                      child: Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(32),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "Вход",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              TextField(
                                controller: store.mailController,
                                decoration:
                                    InputDecoration(labelText: "E-mail"),
                              ),
                              TextField(
                                controller: store.passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Пароль",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Войти"),
                      onPressed: store.loginButtonPress,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
