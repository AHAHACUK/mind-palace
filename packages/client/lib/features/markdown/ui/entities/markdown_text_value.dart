import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_character.dart';

class MarkdownTextValue extends CustomTextValue {
  final List<MarkdownCharacter> characters;
  @override
  final TextSelection selection;

  const MarkdownTextValue(this.characters, this.selection);

  const MarkdownTextValue.empty()
      : characters = const [],
        selection = const TextSelection.collapsed(offset: -1);

  MarkdownTextValue copyWith({
    List<MarkdownCharacter>? characters,
    TextSelection? selection,
  }) {
    return MarkdownTextValue(
      characters ?? this.characters,
      selection ?? this.selection,
    );
  }
}
