part of 'dependency_init.dart';

DependencyBlocFactory _dependencyBlocFactory(DependencyInteractor interactor) {
  return DependencyBlocFactory(nodeInteractor: interactor.node);
}
