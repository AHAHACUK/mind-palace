// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_node_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectNodeModel _$ProjectNodeModelFromJson(Map<String, dynamic> json) =>
    ProjectNodeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentNodeId: (json['parentNodeId'] as num?)?.toInt(),
      order: (json['order'] as num).toInt(),
      isOpened: json['isOpened'] as bool,
    );

Map<String, dynamic> _$ProjectNodeModelToJson(ProjectNodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentNodeId': instance.parentNodeId,
      'name': instance.name,
      'order': instance.order,
      'isOpened': instance.isOpened,
    };
