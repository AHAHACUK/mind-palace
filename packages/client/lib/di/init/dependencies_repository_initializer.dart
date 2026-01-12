import 'package:database_sqlite/database_sqlite.dart';
import 'package:mind_palace/di/dependencies_repositories.dart';
import 'package:mind_palace/features/explorer/data/repositories/sqlite_explorer_repository.dart';

class DependenciesRepositoriesInitializer {
  Future<DependenciesRepositories> init() async {
    return DependenciesRepositories(
      explorer: SqliteExplorerRepository(
        db: ExplorerNodeDatabase(filename: 'mind_palace'),
      ),
    );
  }
}
