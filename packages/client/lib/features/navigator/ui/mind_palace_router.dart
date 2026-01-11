import 'package:mind_palace/features/navigator/domain/entities/app_router_configuration.dart';
import 'package:mind_palace/features/navigator/domain/entities/routes/explorer/exporer_route.dart';
import 'package:mind_palace/features/navigator/domain/entities/routes/explorer/view_route.dart';

final mindPalaceRouter = AppRouterConfiguration(
  initialRoute: ExplorerRoute(''),
  routes: [ExplorerRoute.getConfig(), ViewRoute.getConfig()],
);
