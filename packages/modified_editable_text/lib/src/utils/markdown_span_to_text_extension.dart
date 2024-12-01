import 'package:flutter/material.dart';
import 'package:modified_editable_text/src/entities/modified_text_span.dart';

extension MarkdownSpanToTextExtension on ModifiedTextSpan {
  TextSpan toTextSpan() {
    var textSpan = TextSpan(
      text: text,
    );
    for (final effect in effects) {
      textSpan = effect.apply(textSpan);
    }
    return textSpan;
  }
}
