import 'package:mind_palace_json_storage/storages/blocks/models/project_block_model.dart';
import 'package:mind_palace_json_storage/storages/nodes/models/project_node_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final Map<int, ProjectNodeModel> nodes;
  final Map<int, ProjectBlockModel> blocks;

  const ProjectModel({
    required this.nodes,
    required this.blocks,
  });

  ProjectModel.initial()
      : nodes = {},
        blocks = {};

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
