import 'package:mind_palace/di/dependencies_repositories.dart';
import 'package:mind_palace/features/navigator/data/go_router/go_router_config_repository.dart';

class DependenciesRepositoriesInitializer {
  Future<DependenciesRepositories> init() async {
    return DependenciesRepositories(appRouter: GoRouterConfigRepository());
  }
}
