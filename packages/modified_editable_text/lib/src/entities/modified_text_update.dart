import 'package:modified_editable_text/src/entities/modified_character.dart';
import 'package:flutter/material.dart';

class ModifiedTextUpdate {
  final List<ModifiedCharacter> newCharacters;
  final TextSelection newSelection;
  final String insertedText;

  String get newText =>
      String.fromCharCodes(newCharacters.map((e) => e.codeUnit));

  const ModifiedTextUpdate({
    required this.newCharacters,
    required this.newSelection,
    required this.insertedText,
  });

  ModifiedTextUpdate copyWith({
    List<ModifiedCharacter>? newCharacters,
    TextSelection? newSelection,
  }) {
    return ModifiedTextUpdate(
      newCharacters: newCharacters ?? this.newCharacters,
      newSelection: newSelection ?? this.newSelection,
      insertedText: insertedText,
    );
  }
}
