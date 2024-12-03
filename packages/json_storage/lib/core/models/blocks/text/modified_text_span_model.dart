import 'package:mind_palace_json_storage/core/models/blocks/text/text_effect_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'modified_text_span_model.g.dart';

@JsonSerializable()
class ModifiedTextSpanModel {
  final String text;
  final Set<TextEffectModel> effects;

  const ModifiedTextSpanModel({required this.text, required this.effects});

  factory ModifiedTextSpanModel.fromJson(Map<String, dynamic> json) =>
      _$ModifiedTextSpanModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModifiedTextSpanModelToJson(this);
}
