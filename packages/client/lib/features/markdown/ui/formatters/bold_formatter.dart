import 'package:mind_palace_client/features/markdown/ui/effects/bold_effect.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_character.dart';
import 'package:mind_palace_client/features/markdown/ui/formatters/wrapper_formatter.dart';
import 'package:mind_palace_client/utils/iterable/iterable_contains_type_extension.dart';

class BoldFormatter extends WrapperFormatter {
  const BoldFormatter();

  @override
  void applyToWrapped(List<MarkdownCharacter> entries) {
    for (final entry in entries) {
      if (!entry.effects.containsType<BoldEffect>()) {
        entry.effects.add(const BoldEffect());
      }
    }
  }

  @override
  String get leftWrapperRegex => r'(?<!\*)\*\*(?!\*)';
  @override
  String get rightWrapperRegex => r'(?<!\*)\*\*(?!\*)';
}
