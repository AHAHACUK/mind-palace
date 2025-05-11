import 'package:client/toolkit/utils/adaptive_size.dart';
import 'package:flutter/material.dart';

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    textTheme: TextTheme.of(context).apply(fontSizeFactor: 3).map((s) => s.sp),
  );
}

extension TextThemeMap on TextTheme {
  TextTheme map(TextStyle Function(TextStyle style) mapper) {
    return TextTheme(
      displayLarge: mapper(displayLarge!),
      displayMedium: mapper(displayMedium!),
      displaySmall: mapper(displaySmall!),
      headlineLarge: mapper(headlineLarge!),
      headlineMedium: mapper(headlineMedium!),
      headlineSmall: mapper(headlineSmall!),
      titleLarge: mapper(titleLarge!),
      titleMedium: mapper(titleMedium!),
      titleSmall: mapper(titleSmall!),
      bodyLarge: mapper(bodyLarge!),
      bodyMedium: mapper(bodyMedium!),
      bodySmall: mapper(bodySmall!),
      labelLarge: mapper(labelLarge!),
      labelMedium: mapper(labelMedium!),
      labelSmall: mapper(labelSmall!),
    );
  }
}
