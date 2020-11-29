// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    json['department'] == null
        ? null
        : Department.fromJson(json['department'] as Map<String, dynamic>),
    json['education'] as String,
    json['email'] as String,
    json['experienceYears'] as int,
    json['birthYear'] as int,
    json['firstName'] as String,
    json['lastName'] as String,
    json['middleName'] as String,
    json['position'] as String,
    _$enumDecodeNullable(_$UserRoleEnumMap, json['role'],
        unknownValue: UserRole.worker),
    json['rating'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'department': instance.department,
      'education': instance.education,
      'email': instance.email,
      'experienceYears': instance.experienceYears,
      'birthYear': instance.birthYear,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'position': instance.position,
      'rating': instance.rating,
      'role': _$UserRoleEnumMap[instance.role],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$UserRoleEnumMap = {
  UserRole.worker: 'worker',
  UserRole.expert: 'expert',
  UserRole.admin: 'admin',
};
