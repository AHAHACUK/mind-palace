import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_working_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_storage_repository.dart';

class ProjectNodeInteractor {
  final ProjectNodeWorkingRepository _working;
  final ProjectNodeStorageRepository _storage;

  const ProjectNodeInteractor({
    required ProjectNodeWorkingRepository working,
    required ProjectNodeStorageRepository storage,
  })  : _working = working,
        _storage = storage;

  Future<void> init() async {
    final nodes = await _storage.getAllNodes();
    _working.setNodes(nodes);
  }

  ProjectNode getRootNode() {
    final node = _working.getRootNode();
    return node;
  }

  ProjectNode getNode(int id) {
    final node = _working.getNode(id);
    return node;
  }

  List<ProjectNode> getNodeChildren(int id) {
    final nodes = _working.getNodeChildren(id);
    return nodes;
  }

  ProjectNode createNode(int parentNodeId) {
    final int order = _working.getNodeChildren(parentNodeId).length;
    return _working.createNode(
      ProjectNodeCreateDto(
        name: 'New Node',
        order: order,
        parentId: parentNodeId,
        isOpened: true,
      ),
    );
  }

  ProjectNode unParentNode(
    int id,
  ) {
    return _working.unParentNode(id);
  }

  ProjectNode parentNode(
    int id,
    int parentId,
    int order,
  ) {
    return _working.parentNode(id, parentId, order);
  }

  void setIsOpened(int id, bool isOpened) {
    _working.setIsOpened(id, isOpened);
  }
}
