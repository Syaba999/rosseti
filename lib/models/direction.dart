import 'package:json_annotation/json_annotation.dart';
import 'package:rosseti/models/chat_theme.dart';

part 'direction.g.dart';

@JsonSerializable()
class Direction {
  final String id;
  final String name;
  final List<ChatTheme> themes;

  Direction(this.id, this.name, this.themes);

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionToJson(this);
}
