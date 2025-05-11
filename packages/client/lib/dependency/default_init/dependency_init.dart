import 'package:client/dependency/dependency.dart';
import 'package:client/dependency/entities/dependency_bloc_factory.dart';
import 'package:client/dependency/entities/dependency_data_source.dart';
import 'package:client/dependency/entities/dependency_interactor.dart';
import 'package:client/dependency/entities/dependency_repository.dart';
import 'package:client/features/nodes/data/repositories/memory_node_repository.dart';
import 'package:client/features/nodes/domain/interactor/node_interactor.dart';

part 'dependency_data_source_init.dart';
part 'dependency_repository_init.dart';
part 'dependency_interactor_init.dart';
part 'dependency_bloc_factory_init.dart';

void dependencyInit() {
  final dataSource = _dependencyDataSource();
  final repository = _dependencyRepository(dataSource);
  final interactor = _dependencyInteractor(repository);
  final blocFactory = _dependencyBlocFactory(interactor);
  final deps = Dependency(interactor: interactor, blocFactory: blocFactory);
  deps.setup();
}
