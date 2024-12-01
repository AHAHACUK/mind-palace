import 'package:mind_palace_client/features/navigation/data/repository/json_storage_project_node_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/interactor/project_node_interactor.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_repository.dart';
import 'package:mind_palace_json_storage/core/mind_palace_json_storage.dart';

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
