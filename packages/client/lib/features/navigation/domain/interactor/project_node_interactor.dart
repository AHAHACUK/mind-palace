import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_repository.dart';

class ProjectNodeInteractor {
  final ProjectNodeRepository _repository;

  ProjectNodeInteractor({required ProjectNodeRepository repository})
      : _repository = repository;

  List<ProjectNode> getNodesTrees() {
    return _repository.getNodesTrees();
  }

  void updateNodeName(ProjectNode node, String name) {
    _repository.updateNodeName(node, name);
  }

  void updateNodePosition(
    ProjectNode node,
    ProjectNode newParent,
    int newOrder,
  ) {
    _repository.updateNodePosition(
      node,
      newParent,
      newOrder,
    );
  }
}
