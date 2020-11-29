import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/chat_item.dart';
import 'package:rosseti/models/chat_theme.dart';
import 'package:rosseti/models/socket_data.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/socket_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore extends MobxBase with Store {
  final _socketService = InjectorService.getInjector.get<SocketService>();
  final _userStore = InjectorService.getInjector.get<UserStore>();

  @override
  void dispose() {}

  @observable
  int newMessageLength = 0;

  ChatTheme theme;

  TextEditingController chatController;

  @observable
  List<ChatItem> _chatItems;

  List<ChatItem> get chatItems => _chatItems.reversed.toList();

  void init(ChatTheme theme) {
    this.theme = theme;
    chatController = TextEditingController();
    chatController.addListener(_chatControllerListener);
    _chatItems = List();
    final joinUser = JoinUser(
        "${_userStore.getUser.firstName} ${_userStore.getUser.lastName}",
        _userStore.getUser.id,
        theme?.id ?? "1");
    _addListeners();
    _socketService.emit(SocketAction.joined_user, joinUser);
  }

  @action
  void _chatControllerListener() {
    newMessageLength = chatController.text.length;
  }

  @action
  void _addListeners() {
    _socketService.addListener(SocketAction.chat, (data) {
      final chat = Chat.fromJson(jsonDecode(data));
      final chatItem = ChatItem(chat.username, chat.message, null);
      _chatItems = List.from(_chatItems)..add(chatItem);
    });
  }

  @action
  void sendMessage() {
    final chatItem = ChatItem(
        "${_userStore.getUser.firstName} ${_userStore.getUser.lastName}",
        chatController.text,
        _userStore.getUser.id);
    final chat = Chat(chatItem.title, chatItem.text);
    _socketService.emit(SocketAction.chat, chat);
    _chatItems = List.from(_chatItems)..add(chatItem);
    chatController.clear();
  }
}
