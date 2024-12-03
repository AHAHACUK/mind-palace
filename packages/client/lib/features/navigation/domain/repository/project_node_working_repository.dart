import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_client/utils/nullable/nullable.dart';

part 'project_node_working_repository_dtos.dart';

/// Place to store working copy of nodes
abstract class ProjectNodeWorkingRepository {
  void setNodes(List<ProjectNode> nodes);

  List<ProjectNode> getNodes();

  ProjectNode getRootNode();

  List<ProjectNode> getNodeChildren(int id);

  ProjectNode getNode(
    int id,
  );

  ProjectNode createNode(ProjectNodeCreateDto request);

  ProjectNode unParentNode(
    int id,
  );

  ProjectNode parentNode(
    int id,
    int newParentId,
    int order,
  );

  ProjectNode setIsOpened(int id, bool isOpened);
}
