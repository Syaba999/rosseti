import 'dart:convert';

import 'package:rosseti/api/urls.dart' as urls;
import 'package:rosseti/data/persistent/persistent_data_source.dart';
import 'package:rosseti/store/user_store.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'injector_service.dart';

class SocketService {
  final _prefs = InjectorService.getInjector.get<PersistentDataSource>();
  final _userStore = InjectorService.getInjector.get<UserStore>();
  Socket _socket;
  bool get isReady => _socket != null;

  void init() {
    final socketUrl = urls.socketUrl;
    print(socketUrl);
    _socket = io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.connect();
    _socket.emit("connection");
    _listen();
  }

  bool get connected => _socket != null ? _socket.connected : false;

  void addListener(SocketAction action, Function(dynamic data) message) {
    if (_socket != null) {
      _socket.on(action.action, message);
    }
  }

  void emit(SocketAction action, dynamic data) {
    _socket.emit(action.action, jsonEncode(data));
  }

  void _listen() {
    _socket.onConnect((_) {
      print('connect');
      _socket.emit('joined-user', 'test');
    });
    for (var action in SocketAction.values) {
      _socket.on(action.action, (data) {
        print("${action.action} $data");
      });
    }
    _socket.on("joined-user", (data) => "print $data");
  }

  void connect() {
    _socket.connect();
  }

  void close() {
    _socket.close();
  }
}

enum SocketAction {
  joined_user,
  typing,
  chat,
  disconnect,
}

extension _SocketActionExtension on SocketAction {
  String get action => this.toString().split(".").last.replaceAll("_", "-");
}
