import 'package:flutter/widgets.dart';

/// Contains specific action user made to text
class TextEdit {
  final int index;
  final String deleted;
  final String inserted;

  const TextEdit._({
    required this.index,
    required this.deleted,
    required this.inserted,
  });

  /// Determines user action from previous [TextEditingValue] and current [TextEditingValue]
  /// 
  /// Expects only PC inputs with hardware keyboard.
  static TextEdit? fromTextEditingValues(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldText = oldValue.text;
    final newText = newValue.text;
    if (oldText == newText) return null;
    final oldTextLength = oldText.length;
    final newTextLength = newText.length;
    final oldSelection = oldValue.selection;
    final newSelection = newValue.selection;
    assert(
      newSelection.isCollapsed,
      'Unexpected: text changed, and new selection is not collapsed O_O',
    );
    final newOffset = newSelection.baseOffset;
    final (oldSelectionStart, oldSelectionEnd) =
        _getSelectionEdges(oldSelection);
    final int index;
    final String deleted;
    final String inserted;
    if (oldSelectionStart != oldSelectionEnd) {
      // Any text replacement
      index = oldSelectionStart;
      deleted = oldText.substring(oldSelectionStart, oldSelectionEnd);
      inserted = newText.substring(oldSelectionStart, newOffset);
    } else if (oldSelectionStart < newOffset) {
      assert(oldTextLength < newTextLength, 'Expected insertion only');
      // Inserting with collapsed selection
      index = oldSelectionStart;
      deleted = '';
      inserted = newText.substring(oldSelectionStart, newOffset);
    } else if (oldSelectionStart > newOffset) {
      assert(oldTextLength > newTextLength, 'Expected deletion only');
      // Deleting with BACKSPACE with collapsed selection
      index = newOffset;
      deleted = oldText.substring(newOffset, oldSelectionStart);
      inserted = '';
    } else {
      assert(oldTextLength > newTextLength, 'Expected deletion only');
      // Deleting with DELETE with collapsed selection
      index = oldSelectionStart;
      deleted = oldText.substring(
        oldSelectionStart,
        oldSelectionStart + oldTextLength - newTextLength,
      );
      inserted = '';
    }
    return TextEdit._(
      index: index,
      deleted: deleted,
      inserted: inserted,
    );
  }

  static (int, int) _getSelectionEdges(TextSelection selection) {
    final offset = selection.baseOffset;
    final extent = selection.extentOffset;
    final selectionForward = extent > offset;
    final selectionStart = selectionForward ? offset : extent;
    final selectionEnd = selectionForward ? extent : offset;
    return (selectionStart, selectionEnd);
  }
}
