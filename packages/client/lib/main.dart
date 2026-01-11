import 'package:flutter/material.dart';
import 'package:mind_palace/di/dependencies.dart';
import 'package:mind_palace/di/dependencies_provider.dart';
import 'package:mind_palace/di/init/dependencies_initializer.dart';
import 'package:mind_palace/features/navigator/ui/mind_palace_router.dart';

void main() async {
  final depsInit = DependenciesInitializer();
  final deps = await depsInit.init();
  runApp(_App(deps: deps));
}

class _App extends StatelessWidget {
  final Dependencies deps;
  const _App({required this.deps});

  @override
  Widget build(BuildContext context) {
    return DependenciesProvider(
      deps: deps,
      child: MaterialApp.router(
        routerConfig: deps.interactors.appRouter.fromAppConfig(
          mindPalaceRouter,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
