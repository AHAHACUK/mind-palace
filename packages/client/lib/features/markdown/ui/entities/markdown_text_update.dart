import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_character.dart';

class MarkdownTextUpdate {
  final List<MarkdownCharacter> newCharacters;
  final TextSelection newSelection;
  final String insertedText;

  String get newText =>
      String.fromCharCodes(newCharacters.map((e) => e.codeUnit));

  const MarkdownTextUpdate({
    required this.newCharacters,
    required this.newSelection,
    required this.insertedText,
  });

  MarkdownTextUpdate copyWith({
    List<MarkdownCharacter>? newCharacters,
    TextSelection? newSelection,
  }) {
    return MarkdownTextUpdate(
      newCharacters: newCharacters ?? this.newCharacters,
      newSelection: newSelection ?? this.newSelection,
      insertedText: insertedText,
    );
  }
}
