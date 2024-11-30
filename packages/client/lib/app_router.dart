import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace_client/features/markdown/ui/pages/test_text_page.dart';

final _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const TestTextPage(),
    ),
  ],
);

RouterConfig<Object> get appRouterConfig => _goRouter;
