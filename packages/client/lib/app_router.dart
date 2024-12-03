import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace_client/features/app/ui/pages/app_page.dart';

final _goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const AppPage(),
    ),
  ],
);

RouterConfig<Object> get appRouterConfig => _goRouter;
