import 'package:flutter/material.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_router_configuration.dart';
import 'package:mind_palace/features/navigator/domain/repositories/app_router_config_repository.dart';

class AppRouterConfigInteractor {
  final AppRouterConfigRepository _rep;

  AppRouterConfigInteractor({required AppRouterConfigRepository rep})
    : _rep = rep;

  RouterConfig<Object> fromAppConfig(AppRouterConfiguration config) {
    return _rep.fromAppConfig(config);
  }
}
