import 'package:flutter/material.dart';

abstract class CustomInputHandler<T> {
  T handleKey({
    required KeyEvent keyEvent,
    required TextSelection selection,
  });
}
