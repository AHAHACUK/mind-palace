part of 'dependencies.dart';

Future<_DependenciesInteractors> _initInteractors(
  _DependenciesRepositories repositories,
) async {
  final projectNodes = ProjectNodeInteractor(
    working: repositories.workingNodes,
    storage: repositories.storageNodes,
  );
  await projectNodes.init();

  final projectBlocks = ProjectBlockInteractor(
    working: repositories.workingBlocks,
    storage: repositories.storageBlocks,
  );
  await projectBlocks.init();

  return _DependenciesInteractors(
    projectNodes: projectNodes,
    projectBlocks: projectBlocks,
  );
}

class _DependenciesInteractors {
  final ProjectNodeInteractor projectNodes;
  final ProjectBlockInteractor projectBlocks;

  _DependenciesInteractors({
    required this.projectNodes,
    required this.projectBlocks,
  });
}
