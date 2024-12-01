import 'dart:math';

import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:modified_editable_text/src/entities/modified_character.dart';
import 'package:modified_editable_text/src/entities/modified_text_span.dart';
import 'package:modified_editable_text/src/entities/modified_text_update.dart';
import 'package:modified_editable_text/src/entities/modified_text_value.dart';
import 'package:modified_editable_text/src/interfaces/text_modifier.dart';
import 'package:modified_editable_text/src/utils/markdown_span_to_text_extension.dart';
import 'package:modified_editable_text/src/utils/text_range_normalized_extension.dart';
import 'package:flutter/material.dart';

class ModifiedTextController extends CustomTextController<ModifiedTextValue> {
  final List<TextModifier> _modifiers;

  ModifiedTextController({required List<TextModifier> modifiers})
      : _modifiers = modifiers,
        super(const ModifiedTextValue.empty());

  @override
  TextSelection get selection => value.selection;

  @override
  int get textLength => value.characters.length;

  @override
  set selection(TextSelection selection) {
    value = value.copyWith(selection: selection);
  }

  void _formatAndApply(
    ModifiedTextUpdate update,
  ) {
    for (final formatter in _modifiers) {
      update = formatter.apply(update);
    }
    value = value.copyWith(
      characters: update.newCharacters,
      selection: update.newSelection,
    );
  }

  void replaceText(TextRange range, String text) {
    final normalizedRange = range.normalized;
    if (normalizedRange.end < 0) return;
    if (normalizedRange.start > value.characters.length) return;
    final start = max(normalizedRange.start, 0);
    final oldEnd = min(normalizedRange.end, value.characters.length);
    final newEnd = start + text.length;
    final newCharacters = List.of(value.characters);
    newCharacters.removeRange(start, oldEnd);
    newCharacters.insertAll(
      start,
      ModifiedCharacter.listFromString(text),
    );
    final newSelection = TextSelection.collapsed(offset: newEnd);
    _formatAndApply(
      ModifiedTextUpdate(
        newCharacters: newCharacters,
        newSelection: newSelection,
        insertedText: text,
      ),
    );
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
  }) {
    final characters = value.characters;
    if (characters.isEmpty) return const TextSpan();
    final markdownSpans = characters.toSpans();
    final parts = markdownSpans.map((e) => e.toTextSpan()).toList();
    return TextSpan(style: style, children: parts);
  }
}
