import 'dart:convert';

import 'package:rosseti/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentDataSource {
  static SharedPreferences _localStorage;
  PersistentDataSource._internal();

  static Future<PersistentDataSource> create() async {
    _localStorage = await SharedPreferences.getInstance();
    return PersistentDataSource._internal();
  }

  String _kUser = "USER";
  String _kUserPass = "USER_PASS";

  User getUser() {
    final userString = _localStorage.getString(_kUser);
    if (userString == null) return null;
    return User.fromJson(jsonDecode(userString));
  }

  void setUser(User user) {
    _localStorage.setString(_kUser, jsonEncode(user));
  }

  void removeUser() {
    _localStorage.remove(_kUser);
    _localStorage.remove(_kUserPass);
  }

  String getUserPass() {
    return _localStorage.getString(_kUserPass);
  }

  void setUserPass(String pass) {
    _localStorage.setString(_kUserPass, pass);
  }
}
