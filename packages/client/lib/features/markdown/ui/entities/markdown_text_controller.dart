import 'dart:math';

import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_character.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_formatter.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_span.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_update.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_value.dart';
import 'package:mind_palace_client/features/markdown/ui/formatters/bold_formatter.dart';
import 'package:mind_palace_client/features/markdown/ui/formatters/italic_formatter.dart';
import 'package:mind_palace_client/features/markdown/ui/utils/markdown_span_to_text_extension.dart';
import 'package:mind_palace_client/utils/text_range/text_range_normalized_extension.dart';

class MarkdownTextController extends CustomTextController<MarkdownTextValue> {
  static const _formatters = <MarkdownFormatter>[
    BoldFormatter(),
    ItalicFormatter(),
  ];

  MarkdownTextController() : super(const MarkdownTextValue.empty());

  @override
  TextSelection get selection => value.selection;

  @override
  int get textLength => value.characters.length;

  @override
  set selection(TextSelection selection) {
    value = value.copyWith(selection: selection);
  }

  void _formatAndApply(
    MarkdownTextUpdate update,
  ) {
    for (final formatter in _formatters) {
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
      MarkdownCharacter.listFromString(text),
    );
    final newSelection = TextSelection.collapsed(offset: newEnd);
    _formatAndApply(
      MarkdownTextUpdate(
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
