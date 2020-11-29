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
    final socketUrl = 'url';
    print(socketUrl);
    _socket = io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'extraHeaders': {'cookie': 'token=;'}
    });
    _socket.connect();
    _listen();
  }

  bool get connected => _socket != null ? _socket.connected : false;

  void addListener(SocketAction action, Function(dynamic data) message) {
    if (_socket != null) {
      _socket.on(action.action, message);
    }
  }

  void _listen() {
    for (var action in SocketAction.values) {
      _socket.on(action.action, (data) {
        print("${action.action} $data");
      });
      _socket.on("notification", (data) {
        print("notification $data");
      });
    }
  }

  void connect() {
    _socket.connect();
  }

  void close() {
    _socket.close();
  }
}

enum SocketAction {
  new_chat,
  new_message,
  read_chat,
  read_message,
  notification,
  new_news,
  change_set_status,
  disconnect
}

extension _SocketActionExtension on SocketAction {
  String get action => this.toString().split(".").last;
}
