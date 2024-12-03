import 'package:flutter/material.dart';

typedef SingleChildWidgetBuilder = Widget Function(
  BuildContext context,
  Widget child,
);

class MultiWidget extends StatelessWidget {
  final Widget child;
  final List<SingleChildWidgetBuilder> builders;

  const MultiWidget({
    super.key,
    required this.builders,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var child = this.child;
    final builders = this.builders.reversed;
    for (final builder in builders) {
      child = builder.call(context, child);
    }
    return child;
  }
}
