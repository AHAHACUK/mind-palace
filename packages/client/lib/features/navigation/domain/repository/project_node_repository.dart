import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

abstract class ProjectNodeRepository {
  List<ProjectNode> getNodesTrees();

  void updateNodeName(ProjectNode node, String name);

  void updateNodePosition(
    ProjectNode node,
    ProjectNode newParent,
    int newOrder,
  );
}
