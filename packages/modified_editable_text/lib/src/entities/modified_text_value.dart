import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:modified_editable_text/src/entities/modified_character.dart';
import 'package:flutter/material.dart';

class  ModifiedTextValue extends CustomTextValue {
  final List<ModifiedCharacter> characters;
  @override
  final TextSelection selection;

  const ModifiedTextValue(this.characters, this.selection);

  const ModifiedTextValue.empty()
      : characters = const [],
        selection = const TextSelection.collapsed(offset: -1);

  ModifiedTextValue copyWith({
    List<ModifiedCharacter>? characters,
    TextSelection? selection,
  }) {
    return ModifiedTextValue(
      characters ?? this.characters,
      selection ?? this.selection,
    );
  }
}
