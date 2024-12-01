import 'package:flutter/material.dart';
import 'package:mind_palace_client/utils/text_span/text_span_copy_with_extension.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class ItalicEffect implements TextEffect {
  const ItalicEffect();

  @override
  TextSpan apply(TextSpan textSpan) {
    final style = textSpan.style ?? const TextStyle();
    return textSpan.copyWith(
      style: style.copyWith(
        fontStyle: FontStyle.italic,
      ),
    );
  }
}