import 'package:mind_palace/features/markdown/ui/effects/italic_effect.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_entry.dart';
import 'package:mind_palace/features/markdown/ui/formatters/wrapper_formatter.dart';
import 'package:mind_palace/utils/iterable/iterable_contains_type_extension.dart';

class ItalicFormatter extends WrapperFormatter {
  const ItalicFormatter();

  @override
  void applyToWrapped(List<MarkdownTextEntry> entries) {
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
