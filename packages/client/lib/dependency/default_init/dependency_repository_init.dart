part of 'dependency_init.dart';

DependencyRepository _dependencyRepository(DependencyDataSource dataSource) {
  return DependencyRepository(node: MemoryNodeRepository());
}
