import 'package:flutter/material.dart';

abstract class CustomTextController<T> extends ValueNotifier<T> {
  set selection(TextSelection selection);

  TextSelection get selection;

  int get textLength;

  CustomTextController(super.value);

  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
  });
}
