import 'package:mind_palace/di/dependencies.dart';
import 'package:mind_palace/di/init/dependencies_interactors_initializer.dart';
import 'package:mind_palace/di/init/dependencies_repository_initializer.dart';

class DependenciesInitializer {
  Future<Dependencies> init() async {
    final repositoriesInit = DependenciesRepositoriesInitializer();
    final interactorsInit = DependenciesInteractorsInitializer();
    final repositories = await repositoriesInit.init();
    final interactors = await interactorsInit.init(repositories);
    return Dependencies(interactors: interactors);
  }
}
