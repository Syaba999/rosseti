// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinUser _$JoinUserFromJson(Map<String, dynamic> json) {
  return JoinUser(
    json['username'] as String,
    json['userId'] as String,
    json['roomname'] as String,
  );
}

Map<String, dynamic> _$JoinUserToJson(JoinUser instance) => <String, dynamic>{
      'username': instance.username,
      'userId': instance.userId,
      'roomname': instance.roomname,
    };

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
    json['username'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'username': instance.username,
      'message': instance.message,
    };
