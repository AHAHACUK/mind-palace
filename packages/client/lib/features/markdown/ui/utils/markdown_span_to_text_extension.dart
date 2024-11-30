import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_span.dart';

extension MarkdownSpanToTextExtension on MarkdownTextSpan {
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
