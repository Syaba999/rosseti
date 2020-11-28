// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Direction _$DirectionFromJson(Map<String, dynamic> json) {
  return Direction(
    json['id'] as String,
    json['name'] as String,
    (json['themes'] as List)
        ?.map((e) =>
            e == null ? null : ChatTheme.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DirectionToJson(Direction instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'themes': instance.themes,
    };
