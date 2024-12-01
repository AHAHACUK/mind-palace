import 'package:mind_palace_client/features/blocks/text/effects/bold_effect.dart';
import 'package:mind_palace_client/features/blocks/text/modifiers/wrapper_text_modifier.dart';
import 'package:mind_palace_client/utils/iterable/iterable_contains_type_extension.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class BoldTextModifier extends WrapperTextModifier {
  const BoldTextModifier();

  @override
  void applyToWrapped(List<ModifiedCharacter> entries) {
    for (final entry in entries) {
      if (!entry.effects.containsType<BoldEffect>()) {
        entry.effects.add(const BoldEffect());
      }
    }
  }

  @override
  String get leftWrapperRegex => r'\*\*';
  @override
  String get rightWrapperRegex => r'\*\*';
}
