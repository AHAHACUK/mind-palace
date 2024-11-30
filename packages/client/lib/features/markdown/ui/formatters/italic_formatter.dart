import 'package:mind_palace_client/features/markdown/ui/effects/italic_effect.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_character.dart';
import 'package:mind_palace_client/features/markdown/ui/formatters/wrapper_formatter.dart';
import 'package:mind_palace_client/utils/iterable/iterable_contains_type_extension.dart';

class ItalicFormatter extends WrapperFormatter {
  const ItalicFormatter();

  @override
  void applyToWrapped(List<MarkdownCharacter> entries) {
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
