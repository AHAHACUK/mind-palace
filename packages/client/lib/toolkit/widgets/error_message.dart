import 'package:client/toolkit/utils/adaptive_size.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final VoidCallback onRetry;
  const ErrorMessage({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final theme = context.theme;
    final styles = theme.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(locale.errorOccurred, style: styles.bodyMedium),
        const SizedBox(height: 16).r,
        TextButton(
          onPressed: onRetry,
          child: Text(locale.retry),
        ),
      ],
    );
  }
}
