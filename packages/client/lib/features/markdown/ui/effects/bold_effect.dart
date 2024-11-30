import 'package:flutter/cupertino.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_effect.dart';
import 'package:mind_palace_client/utils/text_span/text_span_copy_with_extension.dart';

class BoldEffect implements MarkdownEffect {
  const BoldEffect();

  @override
  TextSpan apply(TextSpan textSpan) {
    final style = textSpan.style ?? const TextStyle();
    return textSpan.copyWith(
      style: style.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}