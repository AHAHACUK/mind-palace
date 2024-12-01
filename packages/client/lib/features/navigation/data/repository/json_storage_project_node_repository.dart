import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_repository.dart';
import 'package:mind_palace_json_storage/mind_palace_storage.dart';

class JsonStorageProjectNodeRepository implements ProjectNodeRepository {
  final ProjectNodesStorage _storage;

  JsonStorageProjectNodeRepository({
    required MindPalaceCachedJsonStorage storage,
  }) : _storage = storage.nodes;

  @override
  List<ProjectNode> getNodesTrees() {
    final models = _storage.getNodesTrees();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  void updateNodeName(ProjectNode node, String name) {
    _storage.updateNode(
      node.id,
      ProjectNodeUpdateModel(
        name: name,
      ),
    );
  }

  @override
  void updateNodePosition(
    ProjectNode node,
    ProjectNode? newParentNode,
    int newOrder,
  ) {
    _storage.updateNodePosition(
      node.id,
      newParentNode?.id,
      newOrder,
    );
  }
}

extension _ModelParser on ProjectTreeNode {
  ProjectNode toEntity() {
    return ProjectNode(
      id: node.id,
      name: node.name,
      subNodes: subNodes
          .map(
            (e) => e.toEntity(),
          )
          .toList(),
    );
  }
}
