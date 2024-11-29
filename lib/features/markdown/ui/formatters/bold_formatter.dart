import 'package:mind_palace/features/markdown/ui/effects/bold_effect.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_entry.dart';
import 'package:mind_palace/features/markdown/ui/formatters/wrapper_formatter.dart';
import 'package:mind_palace/utils/iterable/iterable_contains_type_extension.dart';

class BoldFormatter extends WrapperFormatter {
  const BoldFormatter();

  @override
  void applyToWrapped(List<MarkdownTextEntry> entries) {
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
