import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/models/chat_item.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/store/user_store.dart';

class ChatBubble extends StatelessWidget {
  final ChatItem chatItem;

  const ChatBubble({Key key, this.chatItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isUserMessage) {
      return Bubble(
        elevation: 1,
        margin: BubbleEdges.only(top: 12),
        alignment: Alignment.topRight,
        nip: BubbleNip.rightTop,
        color: Colors.green[100],
        child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(chatItem.title ?? "",
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.left),
              Text(
                chatItem.text ?? "",
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      );
    }
    return Bubble(
      elevation: 1,
      margin: BubbleEdges.only(top: 12),
      alignment: Alignment.topLeft,
      nip: BubbleNip.leftTop,
      color: Colors.blue[100],
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(chatItem.title ?? "",
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.left),
            Text(
              chatItem.text ?? "",
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }

  bool get isUserMessage =>
      chatItem.userId != null &&
      InjectorService.getInjector.get<UserStore>().getUser.id ==
          chatItem.userId;
}
