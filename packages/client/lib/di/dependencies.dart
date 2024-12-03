import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/json_project_block_storage_repository.dart';
import 'package:mind_palace_client/features/blocks/core/data/repository/memory_project_blocks_working_repository/memory_project_blocks_working_repository.dart';
import 'package:mind_palace_client/features/blocks/core/domain/interactor/project_block_interactor.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_storage_repository.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_working_repository.dart';
import 'package:mind_palace_client/features/navigation/data/repository/json_project_node_storage/json_project_node_storage_repository.dart';
import 'package:mind_palace_client/features/navigation/data/repository/memory_project_node_cache_repository/memory_project_node_cache_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/interactor/project_node_interactor.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_storage_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_working_repository.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_node_cubit/project_node_cubit.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_root_cubit/project_root_cubit.dart';
import 'package:mind_palace_json_storage/core/mind_palace_json_storage.dart';

part 'dependencies_data_sources.dart';
part 'dependencies_repositories.dart';
part 'dependencies_interactors.dart';
part 'dependencies_bloc_factories.dart';

class Dependencies {
  static late final DependenciesBlocFactories blocFactories;

  static Future<void> init() async {
    final dataSources = await _initDataSources();
    final repositories = await _initRepositories(dataSources);
    final interactors = await _initInteractors(repositories);
    final blocFactories = await _initBlocFactories(interactors);
    Dependencies.blocFactories = blocFactories;
  }
}
