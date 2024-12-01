part 'text_effects_models.dart';

sealed class TextEffectModel {
  final String type;

  const TextEffectModel({required this.type});

  factory TextEffectModel.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    return switch (type) {
      BoldTextEffectModel.typeValue => BoldTextEffectModel.fromJson(json),
      ItalicTextEffectModel.typeValue => ItalicTextEffectModel.fromJson(json),
      _ => throw ArgumentError('Unexpected type: $type')
    };
  }
  Map<String, dynamic> toJson();
}
