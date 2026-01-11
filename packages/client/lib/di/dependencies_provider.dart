import 'package:flutter/material.dart';
import 'package:mind_palace/di/dependencies.dart';

class DependenciesProvider extends InheritedWidget {
  final Dependencies deps;

  const DependenciesProvider({
    super.key,
    required super.child,
    required this.deps,
  });

  static Dependencies? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DependenciesProvider>()
        ?.deps;
  }

  static Dependencies of(BuildContext context) {
    final Dependencies? result = maybeOf(context);
    assert(result != null, 'No Dependencies found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant DependenciesProvider oldWidget) {
    return deps != oldWidget.deps;
  }
}
