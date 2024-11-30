import 'package:mind_palace_client/features/markdown/ui/entities/markdown_effect.dart';

class MarkdownCharacter {
  final int codeUnit;
  final Set<MarkdownEffect> effects;

  const MarkdownCharacter({
    required this.codeUnit,
    required this.effects,
  });

  static List<MarkdownCharacter> listFromString(String string) {
    final List<MarkdownCharacter> entries = [];
    final codeUnits = string.codeUnits;
    for (final codeUnit in codeUnits) {
      entries.add(
        MarkdownCharacter(
          codeUnit: codeUnit,
          effects: {},
        ),
      );
    }
    return entries;
  }
}
