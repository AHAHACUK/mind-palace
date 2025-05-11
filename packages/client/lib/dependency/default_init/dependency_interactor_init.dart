part of 'dependency_init.dart';

DependencyInteractor _dependencyInteractor(DependencyRepository repository) {
  return DependencyInteractor(
    node: NodeInteractor(repository: repository.node),
  );
}
