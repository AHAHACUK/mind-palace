import 'package:flutter/material.dart';

sealed class CustomTextIntent extends Intent {
  const CustomTextIntent();
}

class CustomParseIntent extends CustomTextIntent {
  final TextRange range;

  const CustomParseIntent({
    required this.range,
  });
}

class CustomInsertCharacterIntent extends CustomTextIntent {
  final String character;
  final int offset;

  const CustomInsertCharacterIntent({
    required this.character,
    required this.offset,
  });
}

class CustomInsertNewLineIntent extends CustomTextIntent {
  final TextRange range;

  const CustomInsertNewLineIntent({
    required this.range,
  });
}

class CustomReplaceTextIntent extends CustomTextIntent {
  final TextRange range;
  final String newText;

  const CustomReplaceTextIntent({
    required this.range,
    required this.newText,
  });
}

class CustomDeleteRangeIntent extends CustomTextIntent {
  final TextRange range;

  const CustomDeleteRangeIntent({
    required this.range,
  });
}

class CustomDeleteRightIntent extends CustomTextIntent {
  final int offset;

  const CustomDeleteRightIntent({
    required this.offset,
  });
}

class CustomDeleteLeftIntent extends CustomTextIntent {
  final int offset;

  const CustomDeleteLeftIntent({
    required this.offset,
  });
}

class CustomDeleteWordRightIntent extends CustomTextIntent {
  final int offset;

  const CustomDeleteWordRightIntent({
    required this.offset,
  });
}

class CustomDeleteWordLeftIntent extends CustomTextIntent {
  final int offset;

  const CustomDeleteWordLeftIntent({
    required this.offset,
  });
}
