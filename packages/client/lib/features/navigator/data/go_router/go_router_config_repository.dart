import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_route_configuration.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_router_configuration.dart';
import 'package:mind_palace/features/navigator/domain/repositories/app_router_config_repository.dart';

class GoRouterConfigRepository implements AppRouterConfigRepository {
  @override
  RouterConfig<Object> fromAppConfig(AppRouterConfiguration config) {
    return GoRouter(
      initialExtra: config.initialRoute.toUrlString(),
      routes: config.routes.map((e) => _fromAppRouteConfig(e)).toList(),
    );
  }

  GoRoute _fromAppRouteConfig(AppRouteConfiguration config) {
    return GoRoute(path: config.path);
  }
}
