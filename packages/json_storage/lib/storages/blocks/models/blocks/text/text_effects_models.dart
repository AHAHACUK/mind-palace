part of 'text_effect_model.dart';

class BoldTextEffectModel extends TextEffectModel {
  static const typeValue = 'bold';
  const BoldTextEffectModel() : super(type: typeValue);

  factory BoldTextEffectModel.fromJson(Map<String, dynamic> json) =>
      const BoldTextEffectModel();

  @override
  Map<String, dynamic> toJson() => {};
}

class ItalicTextEffectModel extends TextEffectModel {
  static const typeValue = 'italic';
  const ItalicTextEffectModel() : super(type: typeValue);

  factory ItalicTextEffectModel.fromJson(Map<String, dynamic> json) =>
      const ItalicTextEffectModel();

  @override
  Map<String, dynamic> toJson() => {};
}
