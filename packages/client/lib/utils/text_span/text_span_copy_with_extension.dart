import 'package:flutter/material.dart';

extension TextSpanCopyWithExtension on TextSpan {
  TextSpan copyWith({
    TextStyle? style,
  }) {
    return TextSpan(
      text: text,
      style: style ?? this.style,
      children: children,
      recognizer: recognizer,
      mouseCursor: mouseCursor,
      onEnter: onEnter,
      onExit: onExit,
      spellOut: spellOut,
      locale: locale,
      semanticsLabel: semanticsLabel,
    );
  }
}
