import 'package:json_annotation/json_annotation.dart';

part 'socket_data.g.dart';

@JsonSerializable()
class JoinUser {
  final String username;
  final String userId;
  final String roomname;

  JoinUser(this.username, this.userId, this.roomname);

  factory JoinUser.fromJson(Map<String, dynamic> json) =>
      _$JoinUserFromJson(json);
  Map<String, dynamic> toJson() => _$JoinUserToJson(this);
}

@JsonSerializable()
class Chat {
  final String username;
  final String message;

  Chat(this.username, this.message);

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
