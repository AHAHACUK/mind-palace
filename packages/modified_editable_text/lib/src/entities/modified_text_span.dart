import 'package:modified_editable_text/src/entities/modified_character.dart';
import 'package:modified_editable_text/src/interfaces/text_effect.dart';
import 'package:flutter/foundation.dart';

class ModifiedTextSpan {
  final String text;
  final Set<TextEffect> effects;

  const ModifiedTextSpan({required this.text, required this.effects});
  const ModifiedTextSpan.empty()
      : text = '',
        effects = const {};
}

extension MarkdownTextSpanToCharactersExtension on List<ModifiedTextSpan> {
  List<ModifiedCharacter> toCharacters() {
    final List<ModifiedCharacter> characters = [];
    for (final span in this) {
      for (final character in span.text.codeUnits) {
        characters.add(
          ModifiedCharacter(
            codeUnit: character,
            effects: span.effects,
          ),
        );
      }
    }
    return characters;
  }
}

extension MarkdownTextSpanFromCharactersExtension on List<ModifiedCharacter> {
  List<ModifiedTextSpan> toSpans() {
    if (isEmpty) return [];
    final List<ModifiedTextSpan> spans = [];
    final buffer = StringBuffer();
    buffer.writeCharCode(first.codeUnit);
    var currentEffects = first.effects;
    for (var i = 1; i < length; i++) {
      final entry = this[i];
      if (setEquals(currentEffects, entry.effects)) {
        buffer.writeCharCode(entry.codeUnit);
        continue;
      }
      var textSpan = ModifiedTextSpan(
        text: buffer.toString(),
        effects: currentEffects,
      );
      buffer.clear();
      spans.add(textSpan);
      buffer.writeCharCode(entry.codeUnit);
      currentEffects = entry.effects;
    }

    var textSpan = ModifiedTextSpan(
      text: buffer.toString(),
      effects: currentEffects,
    );
    buffer.clear();
    spans.add(textSpan);
    return spans;
  }
}
