import 'package:json_annotation/json_annotation.dart';
import 'package:rosseti/models/company.dart';

part 'department.g.dart';

@JsonSerializable()
class Department {
  final String id;
  final String name;
  final Company company;

  Department(this.id, this.name, this.company);

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
