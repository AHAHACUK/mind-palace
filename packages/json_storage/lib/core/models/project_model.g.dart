// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      nodes: (json['nodes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), ProjectNodeModel.fromJson(e as Map<String, dynamic>)),
      ),
      blocks: (json['blocks'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            ProjectBlockModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'nodes': instance.nodes.map((k, e) => MapEntry(k.toString(), e)),
      'blocks': instance.blocks.map((k, e) => MapEntry(k.toString(), e)),
    };
