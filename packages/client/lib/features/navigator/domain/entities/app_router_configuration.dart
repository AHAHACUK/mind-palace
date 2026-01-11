import 'package:mind_palace/features/navigator/domain/entities/app_route.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_route_configuration.dart';

class AppRouterConfiguration {
  final AppRoute initialRoute;
  final List<AppRouteConfiguration> routes;

  AppRouterConfiguration({required this.initialRoute, required this.routes});
}
