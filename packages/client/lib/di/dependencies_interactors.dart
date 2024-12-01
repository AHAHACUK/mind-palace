part of 'dependencies.dart';

Future<DependenciesInteractors> _initInteractors(
  _DependenciesRepositories repositories,
) async {
  return DependenciesInteractors(
    projectNodes: ProjectNodeInteractor(
      repository: repositories.projectNodes,
    ),
  );
}

class DependenciesInteractors {
  final ProjectNodeInteractor projectNodes;
  DependenciesInteractors({
    required this.projectNodes,
  });
}
