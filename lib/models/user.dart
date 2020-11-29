import 'package:json_annotation/json_annotation.dart';

import 'company.dart';
import 'department.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final Company company;
  final Department department;
  final String education;
  final String email;
  final int experienceYears;
  final int birthYear;
  final String firstName;
  final String lastName;
  final String middleName;
  final String position;
  final int rating;
  @JsonKey(unknownEnumValue: UserRole.worker)
  final UserRole role;

  User(
      this.id,
      this.company,
      this.department,
      this.education,
      this.email,
      this.experienceYears,
      this.birthYear,
      this.firstName,
      this.lastName,
      this.middleName,
      this.position,
      this.role,
      this.rating);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get fullName => "$lastName $firstName $middleName";
}

enum UserRole { worker, expert, admin }
