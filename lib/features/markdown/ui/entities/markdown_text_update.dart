import 'package:flutter/material.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_entry.dart';

class MarkdownTextUpdate {
  final List<MarkdownTextEntry> newEntries;
  final TextSelection newSelection;
  final String insertedText;

  String get newText => String.fromCharCodes(newEntries.map((e) => e.codeUnit));

  const MarkdownTextUpdate({
    required this.newEntries,
    required this.newSelection,
    required this.insertedText,
  });

  MarkdownTextUpdate copyWith({
    List<MarkdownTextEntry>? newEntries,
    TextSelection? newSelection,
  }) {
    return MarkdownTextUpdate(
      newEntries: newEntries ?? this.newEntries,
      newSelection: newSelection ?? this.newSelection,
      insertedText: insertedText,
    );
  }
}
