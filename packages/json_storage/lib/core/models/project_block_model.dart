import 'package:json_annotation/json_annotation.dart';
import 'package:mind_palace_json_storage/core/models/blocks/text/modified_text_span_model.dart';

part 'blocks/text/text_project_block_model.dart';
part 'project_block_model.g.dart';

sealed class ProjectBlockModel {
  final int id;
  final int order;
  final String type;
  final int parentNodeId;

  const ProjectBlockModel({
    required this.id,
    required this.order,
    required this.type,
    required this.parentNodeId,
  });

  factory ProjectBlockModel.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    return switch (type) {
      TextProjectBlockModel.typeValue => TextProjectBlockModel.fromJson(json),
      _ => throw ArgumentError('Unexpected type: $type')
    };
  }
  Map<String, dynamic> toJson();
}
