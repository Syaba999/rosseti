import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/chat_theme.dart';
import 'package:rosseti/pages/chat/widgets/chat_bubble.dart';

import 'mobx/chat_store.dart';

class ChatPage extends StatelessWidget {
  final ChatTheme theme;

  const ChatPage({Key key, this.theme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<ChatStore>(
      builder: _scaffold,
      initFunction: (store) => store.init(theme),
      store: ChatStore(),
    );
  }

  Widget _scaffold(BuildContext context, ChatStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theme?.title ?? "Чат"),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, ChatStore store) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            reverse: true,
            itemCount: store.chatItems.length,
            itemBuilder: (context, index) => ChatBubble(
              chatItem: store.chatItems[index],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: store.chatController,
                decoration: InputDecoration(
                  hintText: "Введите сообщение",
                  filled: true,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              color: Theme.of(context).primaryColor,
              onPressed: store.newMessageLength == 0 ? null : store.sendMessage,
            )
          ],
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
