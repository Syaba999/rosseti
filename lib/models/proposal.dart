import 'package:json_annotation/json_annotation.dart';

part 'proposal.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Proposal {
  final int id;
  final String number;
  final String createdDate;
  final String company;
  final List<String> users;
  final String title;
  final String category;
  final String problemText;
  final String solutionText;
  final String positiveText;
  final List<ProposalRow> necessaryCosts;
  final List<ProposalRow> requiredTerms;
  final List<UserRewards> usersRewards;
  final bool createsSavings;
  final List<String> documents;

  Proposal({
    this.id,
    this.number,
    this.createdDate,
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
}

@JsonSerializable()
class ProposalRow {
  final int id;
  final String name;
  final String text;

  ProposalRow(this.id, this.name, this.text);

  factory ProposalRow.fromJson(Map<String, dynamic> json) =>
      _$ProposalRowFromJson(json);
  Map<String, dynamic> toJson() => _$ProposalRowToJson(this);
}

@JsonSerializable()
class UserRewards {
  final String userName;
  final int userPercents;

  UserRewards(this.userName, this.userPercents);

  factory UserRewards.fromJson(Map<String, dynamic> json) =>
      _$UserRewardsFromJson(json);
  Map<String, dynamic> toJson() => _$UserRewardsToJson(this);
}
