import 'package:mind_palace_client/features/blocks/text/effects/italic_effect.dart';
import 'package:mind_palace_client/features/blocks/text/modifiers/wrapper_text_modifier.dart';
import 'package:mind_palace_client/utils/iterable/iterable_contains_type_extension.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class ItalicTextModifier extends WrapperTextModifier {
  const ItalicTextModifier();

  @override
  void applyToWrapped(List<ModifiedCharacter> entries) {
    for (final entry in entries) {
      if (!entry.effects.containsType<ItalicEffect>()) {
        entry.effects.add(const ItalicEffect());
      }
    }
  }

  @override
  String get leftWrapperRegex => r'(?<!\*)\*(?!\*)';
  @override
  String get rightWrapperRegex => r'(?<!\*)\*(?!\*)';
}
