import 'package:custom_editable_text/src/custom_input_handler.dart';
import 'package:custom_editable_text/src/intents/custom_editable_text_intents.dart';
import 'package:flutter/services.dart';

class KeyboardInputHandler implements CustomInputHandler<CustomTextIntent?> {
  const KeyboardInputHandler();

  @override
  CustomTextIntent? handleKey({
    required KeyEvent keyEvent,
    required TextSelection selection,
  }) {
    if (keyEvent is! KeyDownEvent) return null;
    final isCtrl = HardwareKeyboard.instance.isControlPressed;
    if (keyEvent.logicalKey == LogicalKeyboardKey.keyV && isCtrl) {
      return _handlePaste(selection);
    }
    if (keyEvent.logicalKey == LogicalKeyboardKey.enter) {
      return _handleEnterKey(selection);
    }
    if (keyEvent.logicalKey == LogicalKeyboardKey.backspace) {
      return _handleBackspaceKey(selection);
    }
    if (keyEvent.logicalKey == LogicalKeyboardKey.delete) {
      return _handleDeleteKey(selection);
    }
    if (keyEvent.character != null) {
      return _handleCharacterKey(keyEvent.character!, selection);
    }
    return null;
  }

  CustomTextIntent _handleDeleteKey(TextSelection selection) {
    if (!selection.isCollapsed) {
      return _deleteSelection(selection);
    }
    if (HardwareKeyboard.instance.isControlPressed) {
      return CustomDeleteWordRightIntent(offset: selection.baseOffset);
    }
    return CustomDeleteRightIntent(
      offset: selection.baseOffset,
    );
  }

  CustomTextIntent _handleBackspaceKey(TextSelection selection) {
    if (!selection.isCollapsed) {
      return _deleteSelection(selection);
    }
    if (HardwareKeyboard.instance.isControlPressed) {
      return CustomDeleteWordLeftIntent(offset: selection.baseOffset - 1);
    }
    return CustomDeleteLeftIntent(
      offset: selection.baseOffset,
    );
  }

  CustomTextIntent _handlePaste(TextSelection selection) {
    return CustomParseIntent(
      range: TextRange(
        start: selection.baseOffset,
        end: selection.extentOffset,
      ),
    );
  }

  CustomTextIntent _handleEnterKey(TextSelection selection) {
    return CustomInsertNewLineIntent(
      range: TextRange(
        start: selection.baseOffset,
        end: selection.extentOffset,
      ),
    );
  }

  CustomTextIntent _deleteSelection(TextSelection selection) {
    return CustomDeleteRangeIntent(
      range: TextRange(
        start: selection.baseOffset,
        end: selection.extentOffset,
      ),
    );
  }

  CustomTextIntent _handleCharacterKey(
    String character,
    TextSelection selection,
  ) {
    if (!selection.isCollapsed) {
      return CustomReplaceTextIntent(
        range: TextRange(
          start: selection.baseOffset,
          end: selection.extentOffset,
        ),
        newText: character,
      );
    }
    return CustomInsertCharacterIntent(
      offset: selection.baseOffset,
      character: character,
    );
  }
}
