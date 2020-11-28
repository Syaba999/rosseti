import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rosseti/models/company.dart';
import 'package:rosseti/models/document.dart';
import 'package:rosseti/models/user.dart';

import 'category.dart';

part 'proposal.g.dart';

@JsonSerializable()
class Proposal {
  final String id;
  final Category category;
  final Company company;
  final String createdAt;
  final bool createsSavings;
  final List<Document> documents;
  final String number;
  final String positiveText;
  final String problemText;
  final String solutionText;
  final List<NecessaryCost> necessaryCosts;
  final List<RequiredTerm> requiredTerms;
  final String title;
  final List<User> users;
  final List<UserRewards> usersRewards;

  Proposal({
    this.id,
    this.number,
    this.createdAt,
    this.company,
    this.users,
    this.title,
    this.category,
    this.problemText,
    this.solutionText,
    this.positiveText,
    this.necessaryCosts,
    this.requiredTerms,
    this.usersRewards,
    this.createsSavings,
    this.documents,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);
  Map<String, dynamic> toJson() => _$ProposalToJson(this);

  String get dateFormat =>
      DateFormat("HH:mm dd.MM.yyyy").format(DateTime.parse(createdAt));
}

@JsonSerializable()
class NecessaryCost {
  final String id;
  final String costItem;
  final int number;
  final double sum;

  NecessaryCost(this.id, this.costItem, this.number, this.sum);

  factory NecessaryCost.fromJson(Map<String, dynamic> json) =>
      _$NecessaryCostFromJson(json);
  Map<String, dynamic> toJson() => _$NecessaryCostToJson(this);
}

@JsonSerializable()
class RequiredTerm {
  final String id;
  final int days;
  final String name;
  final int number;

  RequiredTerm(this.id, this.days, this.name, this.number);

  factory RequiredTerm.fromJson(Map<String, dynamic> json) =>
      _$RequiredTermFromJson(json);
  Map<String, dynamic> toJson() => _$RequiredTermToJson(this);
}

@JsonSerializable()
class UserRewards {
  final String id;
  final int count;
  final User user;

  UserRewards(this.user, this.count, this.id);

  factory UserRewards.fromJson(Map<String, dynamic> json) =>
      _$UserRewardsFromJson(json);
  Map<String, dynamic> toJson() => _$UserRewardsToJson(this);
}
