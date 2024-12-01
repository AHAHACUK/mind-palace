// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextProjectBlockModel _$TextProjectBlockModelFromJson(
        Map<String, dynamic> json) =>
    TextProjectBlockModel(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      parentNodeId: (json['parentNodeId'] as num).toInt(),
      textSpans: (json['textSpans'] as List<dynamic>)
          .map((e) => ModifiedTextSpanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TextProjectBlockModelToJson(
        TextProjectBlockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'parentNodeId': instance.parentNodeId,
      'textSpans': instance.textSpans,
    };
