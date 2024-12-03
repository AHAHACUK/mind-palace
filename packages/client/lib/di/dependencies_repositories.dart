part of 'dependencies.dart';

Future<_DependenciesRepositories> _initRepositories(
  _DependenciesDataSources dataSources,
) async {
  return _DependenciesRepositories(
    workingNodes: MemoryProjectNodeCacheRepository(),
    workingBlocks: MemoryProjectBlocksWorkingRepository(),
    storageBlocks: JsonProjectBlockStorageRepository(
      storage: dataSources.mindPalaceJsonStorage,
    ),
    storageNodes: JsonProjectNodeStorageRepository(
      storage: dataSources.mindPalaceJsonStorage,
    ),
  );
}

class _DependenciesRepositories {
  final ProjectNodeWorkingRepository workingNodes;
  final ProjectNodeStorageRepository storageNodes;
  final ProjectBlockWorkingRepository workingBlocks;
  final ProjectBlockStorageRepository storageBlocks;

  _DependenciesRepositories({
    required this.workingNodes,
    required this.storageNodes,
    required this.workingBlocks,
    required this.storageBlocks,
  });
}
