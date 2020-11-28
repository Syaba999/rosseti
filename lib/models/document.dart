import 'package:json_annotation/json_annotation.dart';
import 'package:rosseti/models/proposal.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  final String id;
  final String fileName;
  final String fileUrl;
  final String kind;
  final int listsCount;
  final List<Proposal> proposals;

  Document(this.id, this.fileName, this.fileUrl, this.kind, this.listsCount,
      this.proposals);

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
