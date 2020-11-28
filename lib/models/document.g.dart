// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    json['id'] as String,
    json['fileName'] as String,
    json['fileUrl'] as String,
    json['kind'] as String,
    json['listsCount'] as int,
    (json['proposals'] as List)
        ?.map((e) =>
            e == null ? null : Proposal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
      'kind': instance.kind,
      'listsCount': instance.listsCount,
      'proposals': instance.proposals,
    };
