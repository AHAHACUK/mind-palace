part 'dependencies_data_sources.dart';
part 'dependencies_repositories.dart';
part 'dependencies_interactors.dart';

class Dependencies {
  static late final DependenciesInteractors interactors;

  static Future<void> init() async {
    final dataSources = await _initDataSources();
    final repositories = await _initRepositories(dataSources);
    final interactors = await _initInteractors(repositories);
    Dependencies.interactors = interactors;
  }
}
