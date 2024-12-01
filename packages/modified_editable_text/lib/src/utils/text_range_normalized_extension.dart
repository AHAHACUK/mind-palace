import 'package:flutter/material.dart';

extension TextRangeNormalizedExtension on TextRange {
  TextRange get normalized {
    final isNormalized = this.isNormalized;
    if (isNormalized) {
      return this;
    } else {
      return TextRange(
        start: end,
        end: start,
      );
    }
  }
}
