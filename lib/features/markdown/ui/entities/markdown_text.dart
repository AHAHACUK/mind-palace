import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_entry.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_update.dart';
import 'package:mind_palace/features/markdown/ui/formatters/bold_formatter.dart';
import 'package:mind_palace/features/markdown/ui/formatters/italic_formatter.dart';

class MarkdownText {
  static const _formatters = [
    BoldFormatter(),
    ItalicFormatter(),
  ];

  List<MarkdownTextEntry> _entries;
  TextSelection selection = const TextSelection.collapsed(offset: -1);

  MarkdownText({
    List<MarkdownTextEntry>? entries,
  }) : _entries = entries ?? [];

  MarkdownText.fromString(String text) : _entries = _toFormationEntry(text);

  String get text => String.fromCharCodes(
        _entries.map((e) => e.codeUnit),
      );

  void processTextChange({
    required int index,
    required String text,
    required TextSelection newSelection,
  }) {
    final entries = _toFormationEntry(text);
    final newEntries = List.of(_entries);
    newEntries.insertAll(index, entries);
    var update = MarkdownTextUpdate(
      newEntries: newEntries,
      newSelection: newSelection,
      insertedText: text,
    );
    for (final formatter in _formatters) {
      update = formatter.apply(update);
    }
    _entries = update.newEntries;
    selection = update.newSelection;
  }

  void remove(int index, int length) {
    _entries.removeRange(index, index + length);
  }

  static List<MarkdownTextEntry> _toFormationEntry(String string) {
    final List<MarkdownTextEntry> entries = [];
    final codeUnits = string.codeUnits;
    for (final codeUnit in codeUnits) {
      entries.add(
        MarkdownTextEntry(
          codeUnit: codeUnit,
          effects: {},
        ),
      );
    }
    return entries;
  }

  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    if (_entries.isEmpty) return const TextSpan();
    final List<TextSpan> parts = [];
    final buffer = StringBuffer();
    buffer.writeCharCode(_entries.first.codeUnit);
    var currentEffects = _entries.first.effects;
    for (var i = 1; i < _entries.length; i++) {
      final entry = _entries[i];
      if (setEquals(currentEffects, entry.effects)) {
        buffer.writeCharCode(entry.codeUnit);
        continue;
      }
      var textSpan = TextSpan(text: buffer.toString());
      buffer.clear();
      for (final effect in currentEffects) {
        textSpan = effect.apply(textSpan);
      }
      parts.add(textSpan);
      buffer.writeCharCode(entry.codeUnit);
      currentEffects = entry.effects;
    }

    var textSpan = TextSpan(text: buffer.toString());
    buffer.clear();
    for (final effect in currentEffects) {
      textSpan = effect.apply(textSpan);
    }
    parts.add(textSpan);
    // parts.removeRange(0, 2);
    return TextSpan(style: style, children: parts);
  }

  MarkdownText copyWith() {
    return MarkdownText(
      entries: _entries,
    );
  }

  void clear() {
    _entries.clear();
  }
}
