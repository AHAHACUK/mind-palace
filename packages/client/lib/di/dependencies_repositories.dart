part of 'dependencies.dart';

Future<_DependenciesRepositories> _initRepositories(
  _DependenciesDataSources dataSources,
) async {
  return _DependenciesRepositories(
    projectNodes: JsonStorageProjectNodeRepository(
      storage: dataSources.mindPalaceJsonStorage,
    ),
  );
}

class _DependenciesRepositories {
  final ProjectNodeRepository projectNodes;
  _DependenciesRepositories({
    required this.projectNodes,
  });
}
