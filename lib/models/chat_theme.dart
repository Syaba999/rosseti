import 'package:json_annotation/json_annotation.dart';
import 'package:rosseti/models/user.dart';

import 'direction.dart';

part 'chat_theme.g.dart';

@JsonSerializable()
class ChatTheme {
  final String id;
  final Direction direction;
  final String text;
  final String title;
  final User user;

  ChatTheme(this.id, this.direction, this.text, this.title, this.user);

  factory ChatTheme.fromJson(Map<String, dynamic> json) =>
      _$ChatThemeFromJson(json);
  Map<String, dynamic> toJson() => _$ChatThemeToJson(this);
}
