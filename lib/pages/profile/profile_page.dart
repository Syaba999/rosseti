import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/profile/mobx/profile_store.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatelessObserver<ProfileStore>(
      builder: _content,
      store: ProfileStore(),
    );
  }

  Widget _content(BuildContext context, ProfileStore store) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/no-avatar.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.user.fullName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        store.user.company.name,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      Text(
                        store.user.department.name,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        store.user.position,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: 8),
                      Text("Ваш рейтинг: ${store.user.rating}"),
                      InkWell(
                        onTap: store.leadersTap,
                        child: Text(
                          "Таблица лидеров",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            FlatButton.icon(
              label: Text("Выйти"),
              icon: Icon(Icons.exit_to_app),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
