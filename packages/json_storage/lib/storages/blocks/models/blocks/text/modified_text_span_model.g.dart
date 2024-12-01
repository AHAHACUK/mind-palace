// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modified_text_span_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifiedTextSpanModel _$ModifiedTextSpanModelFromJson(
        Map<String, dynamic> json) =>
    ModifiedTextSpanModel(
      text: json['text'] as String,
      effects: (json['effects'] as List<dynamic>)
          .map((e) => TextEffectModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ModifiedTextSpanModelToJson(
        ModifiedTextSpanModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'effects': instance.effects.toList(),
    };
