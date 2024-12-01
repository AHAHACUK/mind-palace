import 'package:mind_palace_json_storage/storages/nodes/models/project_node_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final Map<int, ProjectNodeModel> nodes;

  const ProjectModel({required this.nodes});

  ProjectModel.initial() : nodes = {};

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
