import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/router/routes/app_route.dart';

extension NavigatorContextExtension on BuildContext {
  void goAppRoute(AppRoute route) {
    GoRouter.of(this).go(route.toUrlString());
  }

  Future<T?> pushAppRoute<T>(AppRoute route) {
    return GoRouter.of(this).push(route.toUrlString());
  }
}
