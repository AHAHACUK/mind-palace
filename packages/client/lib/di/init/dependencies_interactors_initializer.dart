import 'package:mind_palace/di/dependencies_interactors.dart';
import 'package:mind_palace/di/dependencies_repositories.dart';
import 'package:mind_palace/features/explorer/domain/interactors/explorer_interactor.dart';

class DependenciesInteractorsInitializer {
  Future<DependenciesInteractors> init(DependenciesRepositories repos) async {
    return DependenciesInteractors(
      explorer: ExplorerInteractor(rep: repos.explorer),
    );
  }
}
