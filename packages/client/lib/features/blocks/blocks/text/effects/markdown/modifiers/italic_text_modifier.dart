import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/effects/italic_text_effect.dart';
import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/modifiers/wrapper_text_modifier.dart';
import 'package:mind_palace_client/utils/iterable/iterable_contains_type_extension.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class ItalicTextModifier extends WrapperTextModifier {
  const ItalicTextModifier();

  @override
  void applyToWrapped(List<ModifiedCharacter> entries) {
    for (final entry in entries) {
      if (!entry.effects.containsType<ItalicTextEffect>()) {
        entry.effects.add(const ItalicTextEffect());
      }
    }
  }

  @override
  String get leftWrapperRegex => r'(?<!\*)\*(?!\*)';
  @override
  String get rightWrapperRegex => r'(?<!\*)\*(?!\*)';
}
