import 'package:flutter/material.dart';

class NavigationNodeWidget extends StatelessWidget {
  final String label;
  final bool isOpened;
  final int level;

  const NavigationNodeWidget({
    super.key,
    required this.label,
    required this.level,
    required this.isOpened,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final styles = theme.textTheme;
    return Row(
      children: [
        SizedBox(
          width: 8.0 * level,
        ),
        Icon(
          isOpened ? Icons.expand_more : Icons.chevron_right,
          color: colors.onSurface,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: styles.bodyMedium,
        ),
      ],
    );
  }
}
