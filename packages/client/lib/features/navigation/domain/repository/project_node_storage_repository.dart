import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

/// Place to persistently store nodes
abstract class ProjectNodeStorageRepository {
  Future<List<ProjectNode>> getAllNodes();

  Future<void> save(List<ProjectNode> projectNodes);
}
