import 'package:flutter/material.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_router_configuration.dart';

abstract class AppRouterConfigRepository {
  RouterConfig<Object> fromAppConfig(AppRouterConfiguration config);
}
