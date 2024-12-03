import 'package:flutter/material.dart';

class TabsPanel extends StatelessWidget {
  const TabsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
      ),
      child: const Placeholder(),
    );
  }
}
