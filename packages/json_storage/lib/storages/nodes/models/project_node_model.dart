import 'package:json_annotation/json_annotation.dart';
import 'package:mind_palace_json_storage/utils/nullable.dart';

part 'project_node_model.g.dart';

@JsonSerializable()
class ProjectNodeModel {
  final int id;
  final int? parentNodeId;
  final String name;
  final int order;

  ProjectNodeModel({
    required this.id,
    required this.name,
    required this.parentNodeId,
    required this.order,
  });

  ProjectNodeModel copyWith({
    String? name,
    int? order,
    Nullable<int>? parentNodeId,
  }) {
    return ProjectNodeModel(
      id: id,
      name: name ?? this.name,
      parentNodeId:
          parentNodeId != null ? parentNodeId.value : this.parentNodeId,
      order: order ?? this.order,
    );
  }

  factory ProjectNodeModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectNodeModelToJson(this);
}
