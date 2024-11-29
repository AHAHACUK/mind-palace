import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mind_palace/features/markdown/ui/entities/text_edit.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text.dart';

class MarkdownTextController extends ChangeNotifier
    implements ValueListenable<TextEditingValue>, TextEditingController {
  MarkdownText _markdownText = MarkdownText();

  @override
  TextSelection get selection => _markdownText.selection;

  @override
  set selection(TextSelection value) => _markdownText.selection = value;

  TextRange composing = TextRange.empty;

  @override
  String get text => _markdownText.text;

  @override
  set text(String newText) {
    _markdownText = MarkdownText.fromString(newText);
    notifyListeners();
  }

  @override
  TextEditingValue get value {
    return TextEditingValue(
      text: text,
      selection: selection,
    );
  }

  @override
  set value(TextEditingValue newValue) {
    final textEdit = TextEdit.fromTextEditingValues(value, newValue);
    if (textEdit != null) {
      _markdownText.remove(textEdit.index, textEdit.deleted.length);
      _markdownText.processTextChange(
        index: textEdit.index,
        text: textEdit.inserted,
        newSelection: newValue.selection,
      );
    }
    else {
      _markdownText.selection = newValue.selection;
    }
    composing = newValue.composing;
    notifyListeners();
  }

  MarkdownTextController() : super();

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) =>
      _markdownText.buildTextSpan(
        context: context,
        withComposing: withComposing,
        style: style,
      );

  @override
  void clear() {
    composing = TextRange.empty;
    selection = const TextSelection.collapsed(offset: -1);
    _markdownText.clear();
  }

  @override
  void clearComposing() {
    composing = TextRange.empty;
  }
}
