import 'package:flutter/foundation.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_character.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_effect.dart';

class MarkdownTextSpan {
  final String text;
  final Set<MarkdownEffect> effects;

  const MarkdownTextSpan({required this.text, required this.effects});
  const MarkdownTextSpan.empty()
      : text = '',
        effects = const {};
}

extension MarkdownTextSpanToCharactersExtension on List<MarkdownTextSpan> {
  List<MarkdownCharacter> toCharacters() {
    final List<MarkdownCharacter> characters = [];
    for (final span in this) {
      for (final character in span.text.codeUnits) {
        characters.add(
          MarkdownCharacter(
            codeUnit: character,
            effects: span.effects,
          ),
        );
      }
    }
    return characters;
  }
}

extension MarkdownTextSpanFromCharactersExtension on List<MarkdownCharacter> {
  List<MarkdownTextSpan> toSpans() {
    if (isEmpty) return [];
    final List<MarkdownTextSpan> spans = [];
    final buffer = StringBuffer();
    buffer.writeCharCode(first.codeUnit);
    var currentEffects = first.effects;
    for (var i = 1; i < length; i++) {
      final entry = this[i];
      if (setEquals(currentEffects, entry.effects)) {
        buffer.writeCharCode(entry.codeUnit);
        continue;
      }
      var textSpan = MarkdownTextSpan(
        text: buffer.toString(),
        effects: currentEffects,
      );
      buffer.clear();
      spans.add(textSpan);
      buffer.writeCharCode(entry.codeUnit);
      currentEffects = entry.effects;
    }

    var textSpan = MarkdownTextSpan(
      text: buffer.toString(),
      effects: currentEffects,
    );
    buffer.clear();
    spans.add(textSpan);
    return spans;
  }
}
