import 'package:flutter/material.dart';
import 'package:mind_palace/router/routes/explorer/explorer_route.dart';
import 'package:mind_palace/router/routes/view/view_route.dart';
import 'package:go_router/go_router.dart';

RouterConfig<Object> buildRouter() {
  return GoRouter(
    initialLocation: ExplorerRoute('').toUrlString(),
    routes: [ExplorerRoute.toGoRoute(), ViewRoute.toGoRoute()],
  );
}
