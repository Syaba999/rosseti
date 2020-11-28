// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatTheme _$ChatThemeFromJson(Map<String, dynamic> json) {
  return ChatTheme(
    json['id'] as String,
    json['direction'] == null
        ? null
        : Direction.fromJson(json['direction'] as Map<String, dynamic>),
    json['text'] as String,
    json['title'] as String,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChatThemeToJson(ChatTheme instance) => <String, dynamic>{
      'id': instance.id,
      'direction': instance.direction,
      'text': instance.text,
      'title': instance.title,
      'user': instance.user,
    };
