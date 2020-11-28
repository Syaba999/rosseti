// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return Proposal(
    id: json['id'] as int,
    number: json['number'] as String,
    createdDate: json['created_date'] as String,
    company: json['company'] as String,
    users: (json['users'] as List)?.map((e) => e as String)?.toList(),
    title: json['title'] as String,
    category: json['category'] as String,
    problemText: json['problem_text'] as String,
    solutionText: json['solution_text'] as String,
    positiveText: json['positive_text'] as String,
    necessaryCosts: (json['necessary_costs'] as List)
        ?.map((e) =>
            e == null ? null : ProposalRow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requiredTerms: (json['required_terms'] as List)
        ?.map((e) =>
            e == null ? null : ProposalRow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usersRewards: (json['users_rewards'] as List)
        ?.map((e) =>
            e == null ? null : UserRewards.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createsSavings: json['creates_savings'] as bool,
    documents: (json['documents'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ProposalToJson(Proposal instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'created_date': instance.createdDate,
      'company': instance.company,
      'users': instance.users,
      'title': instance.title,
      'category': instance.category,
      'problem_text': instance.problemText,
      'solution_text': instance.solutionText,
      'positive_text': instance.positiveText,
      'necessary_costs': instance.necessaryCosts,
      'required_terms': instance.requiredTerms,
      'users_rewards': instance.usersRewards,
      'creates_savings': instance.createsSavings,
      'documents': instance.documents,
    };

ProposalRow _$ProposalRowFromJson(Map<String, dynamic> json) {
  return ProposalRow(
    json['id'] as int,
    json['name'] as String,
    json['text'] as String,
  );
}

Map<String, dynamic> _$ProposalRowToJson(ProposalRow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
    };

UserRewards _$UserRewardsFromJson(Map<String, dynamic> json) {
  return UserRewards(
    json['userName'] as String,
    json['userPercents'] as int,
  );
}

Map<String, dynamic> _$UserRewardsToJson(UserRewards instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userPercents': instance.userPercents,
    };
