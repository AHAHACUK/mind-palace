import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/effects/bold_text_effect.dart';
import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/modifiers/wrapper_text_modifier.dart';
import 'package:mind_palace_client/utils/iterable/iterable_contains_type_extension.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class BoldTextModifier extends WrapperTextModifier {
  const BoldTextModifier();

  @override
  void applyToWrapped(List<ModifiedCharacter> entries) {
    for (final entry in entries) {
      if (!entry.effects.containsType<BoldTextEffect>()) {
        entry.effects.add(const BoldTextEffect());
      }
    }
  }

  @override
  String get leftWrapperRegex => r'\*\*';
  @override
  String get rightWrapperRegex => r'\*\*';
}
