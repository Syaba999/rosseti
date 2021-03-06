// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ProposalCopyWith on Proposal {
  Proposal copyWith({
    Category category,
    Company company,
    String createdAt,
    bool createsSavings,
    List<Document> documents,
    String id,
    int likes,
    List<NecessaryCost> necessaryCosts,
    String number,
    String positiveText,
    String problemText,
    List<RequiredTerm> requiredTerms,
    String solutionText,
    String title,
    List<User> users,
    List<UserRewards> usersRewards,
  }) {
    return Proposal(
      category: category ?? this.category,
      company: company ?? this.company,
      createdAt: createdAt ?? this.createdAt,
      createsSavings: createsSavings ?? this.createsSavings,
      documents: documents ?? this.documents,
      id: id ?? this.id,
      likes: likes ?? this.likes,
      necessaryCosts: necessaryCosts ?? this.necessaryCosts,
      number: number ?? this.number,
      positiveText: positiveText ?? this.positiveText,
      problemText: problemText ?? this.problemText,
      requiredTerms: requiredTerms ?? this.requiredTerms,
      solutionText: solutionText ?? this.solutionText,
      title: title ?? this.title,
      users: users ?? this.users,
      usersRewards: usersRewards ?? this.usersRewards,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return Proposal(
    likes: json['likes'] as int,
    id: json['id'] as String,
    number: json['number'] as String,
    createdAt: json['createdAt'] as String,
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    users: (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    problemText: json['problemText'] as String,
    solutionText: json['solutionText'] as String,
    positiveText: json['positiveText'] as String,
    necessaryCosts: (json['necessaryCosts'] as List)
        ?.map((e) => e == null
            ? null
            : NecessaryCost.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requiredTerms: (json['requiredTerms'] as List)
        ?.map((e) =>
            e == null ? null : RequiredTerm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usersRewards: (json['usersRewards'] as List)
        ?.map((e) =>
            e == null ? null : UserRewards.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createsSavings: json['createsSavings'] as bool,
    documents: (json['documents'] as List)
        ?.map((e) =>
            e == null ? null : Document.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProposalToJson(Proposal instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'company': instance.company,
      'createdAt': instance.createdAt,
      'createsSavings': instance.createsSavings,
      'documents': instance.documents,
      'number': instance.number,
      'positiveText': instance.positiveText,
      'problemText': instance.problemText,
      'solutionText': instance.solutionText,
      'necessaryCosts': instance.necessaryCosts,
      'requiredTerms': instance.requiredTerms,
      'title': instance.title,
      'users': instance.users,
      'usersRewards': instance.usersRewards,
      'likes': instance.likes,
    };

NecessaryCost _$NecessaryCostFromJson(Map<String, dynamic> json) {
  return NecessaryCost(
    json['id'] as String,
    json['costItem'] as String,
    json['number'] as int,
    (json['sum'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$NecessaryCostToJson(NecessaryCost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'costItem': instance.costItem,
      'number': instance.number,
      'sum': instance.sum,
    };

RequiredTerm _$RequiredTermFromJson(Map<String, dynamic> json) {
  return RequiredTerm(
    json['id'] as String,
    json['days'] as int,
    json['name'] as String,
    json['number'] as int,
  );
}

Map<String, dynamic> _$RequiredTermToJson(RequiredTerm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'days': instance.days,
      'name': instance.name,
      'number': instance.number,
    };

UserRewards _$UserRewardsFromJson(Map<String, dynamic> json) {
  return UserRewards(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['count'] as int,
    json['id'] as String,
  );
}

Map<String, dynamic> _$UserRewardsToJson(UserRewards instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'user': instance.user,
    };
