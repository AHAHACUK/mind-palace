import 'package:json_annotation/json_annotation.dart';

part 'project_node_model.g.dart';

@JsonSerializable()
class ProjectNodeModel {
  final int id;
  final int? parentNodeId;
  final String name;
  final int order;
  final bool isOpened;

  ProjectNodeModel({
    required this.id,
    required this.name,
    required this.parentNodeId,
    required this.order,
    required this.isOpened,
  });

  factory ProjectNodeModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectNodeModelToJson(this);
}
