import 'package:mind_palace_json_storage/core/models/project_block_model.dart';
import 'package:mind_palace_json_storage/core/models/project_node_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final List<ProjectNodeModel> nodes;
  final List<ProjectBlockModel> blocks;

  ProjectModel({
    required this.nodes,
    required this.blocks,
  });

  ProjectModel copyWith({
    List<ProjectNodeModel>? nodes,
    List<ProjectBlockModel>? blocks,
  }) {
    return ProjectModel(
      nodes: nodes ?? this.nodes,
      blocks: blocks ?? this.blocks,
    );
  }

  ProjectModel.initial()
      : nodes = [],
        blocks = [];

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
