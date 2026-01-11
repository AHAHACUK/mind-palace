import 'package:mind_palace/di/dependencies_interactors.dart';
import 'package:mind_palace/di/dependencies_repositories.dart';
import 'package:mind_palace/features/navigator/domain/interactors/app_router_config_interactor.dart';

class DependenciesInteractorsInitializer {
  Future<DependenciesInteractors> init(DependenciesRepositories repos) async {
    return DependenciesInteractors(
      appRouter: AppRouterConfigInteractor(rep: repos.appRouter),
    );
  }
}
