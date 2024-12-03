part of 'dependencies.dart';

Future<DependenciesBlocFactories> _initBlocFactories(
  _DependenciesInteractors interactors,
) async {
  return DependenciesBlocFactories(
    projectRoot: () => ProjectRootCubit(
      nodeInteractor: interactors.projectNodes,
    ),
    projectNode: (id) => ProjectNodeCubit(
      id: id,
      nodeInteractor: interactors.projectNodes,
    ),
  );
}

class DependenciesBlocFactories {
  final ProjectRootCubit Function() projectRoot;
  final ProjectNodeCubit Function(int id) projectNode;

  DependenciesBlocFactories({
    required this.projectRoot,
    required this.projectNode,
  });
}
