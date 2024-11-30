import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:flutter/services.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_controller.dart';

class MarkdownIntentHandler implements CustomIntentHandler<CustomTextIntent> {
  final MarkdownTextController controller;

  const MarkdownIntentHandler({required this.controller});

  @override
  void handleIntent(CustomTextIntent intent) {
    switch (intent) {
      case CustomReplaceTextIntent _:
        controller.replaceText(
          intent.range,
          intent.newText,
        );
      case CustomDeleteWordLeftIntent _:
        _deleteWordLeft(intent.offset);
      case CustomDeleteWordRightIntent _:
        _deleteWordRight(intent.offset);
      case CustomInsertCharacterIntent():
        controller.replaceText(
          TextRange.collapsed(intent.offset),
          intent.character,
        );
      case CustomInsertNewLineIntent():
        controller.replaceText(
          TextRange.collapsed(intent.offset),
          '\n',
        );
      case CustomReplaceWithNewLineIntent():
        controller.replaceText(
          intent.range,
          '\n',
        );
      case CustomDeleteRangeIntent():
        controller.replaceText(
          intent.range,
          '',
        );
      case CustomDeleteRightIntent():
        controller.replaceText(
          TextRange(
            start: intent.offset,
            end: intent.offset + 1,
          ),
          '',
        );
      case CustomDeleteLeftIntent _:
        controller.replaceText(
          TextRange(
            start: intent.offset - 1,
            end: intent.offset,
          ),
          '',
        );
        break;
    }
  }

  void _deleteWordRight(int start) {
    final characters = controller.value.characters;
    if (start == characters.length) return;
    final isStartWhiteSpace = TextLayoutMetrics.isWhitespace(
      characters[start].codeUnit,
    );
    var end = start + 1;
    for (; end < characters.length; end++) {
      final isEndWhiteSpace =
          TextLayoutMetrics.isWhitespace(characters[end].codeUnit);
      if (isEndWhiteSpace != isStartWhiteSpace) {
        break;
      }
    }
    controller.replaceText(TextRange(start: start, end: end), '');
  }

  void _deleteWordLeft(int start) {
    if (start == -1) return;
    final characters = controller.value.characters;
    final isStartWhiteSpace = TextLayoutMetrics.isWhitespace(
      characters[start].codeUnit,
    );
    var end = start;
    start -= 1;
    for (; start >= 0; start--) {
      final isEndWhiteSpace =
          TextLayoutMetrics.isWhitespace(characters[start].codeUnit);
      if (isStartWhiteSpace != isEndWhiteSpace) {
        break;
      }
    }
    controller.replaceText(TextRange(start: start + 1, end: end + 1), '');
  }
}
