// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  final _$newMessageLengthAtom = Atom(name: '_ChatStore.newMessageLength');

  @override
  int get newMessageLength {
    _$newMessageLengthAtom.reportRead();
    return super.newMessageLength;
  }

  @override
  set newMessageLength(int value) {
    _$newMessageLengthAtom.reportWrite(value, super.newMessageLength, () {
      super.newMessageLength = value;
    });
  }

  final _$_chatItemsAtom = Atom(name: '_ChatStore._chatItems');

  @override
  List<ChatItem> get _chatItems {
    _$_chatItemsAtom.reportRead();
    return super._chatItems;
  }

  @override
  set _chatItems(List<ChatItem> value) {
    _$_chatItemsAtom.reportWrite(value, super._chatItems, () {
      super._chatItems = value;
    });
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  void _chatControllerListener() {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore._chatControllerListener');
    try {
      return super._chatControllerListener();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addListeners() {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore._addListeners');
    try {
      return super._addListeners();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessage() {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.sendMessage');
    try {
      return super.sendMessage();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newMessageLength: ${newMessageLength}
    ''';
  }
}
