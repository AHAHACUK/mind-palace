import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_working_repository.dart';
import 'package:mind_palace_client/utils/nullable/nullable.dart';

part 'extensions.dart';

class MemoryProjectNodeCacheRepository implements ProjectNodeWorkingRepository {
  final Map<int, ProjectNode> _nodes = {};

  @override
  List<ProjectNode> getNodes() {
    return _nodes.values.toList();
  }

  @override
  void setNodes(List<ProjectNode> nodes) {
    _nodes.clear();
    _nodes.addEntries(nodes.map((e) => MapEntry(e.id, e)));
  }

  @override
  ProjectNode getRootNode() {
    return _nodes.values.firstWhere((e) => e.parentNodeId == null);
  }

  @override
  List<ProjectNode> getNodeChildren(int id) {
    return _nodes.values.where((e) => e.parentNodeId == id).toList();
  }

  @override
  ProjectNode getNode(
    int id,
  ) {
    final node = _nodes[id]!;
    return node;
  }

  int _getFreeId() {
    for (var i = 0;; i++) {
      if (_nodes[i] == null) {
        return i;
      }
    }
  }

  @override
  ProjectNode createNode(ProjectNodeCreateDto dto) {
    final id = _getFreeId();
    final node = ProjectNode(
      id: id,
      name: dto.name,
      parentNodeId: dto.parentId,
      order: dto.order,
      isOpened: dto.isOpened,
    );
    _nodes[id] = node;
    return node;
  }

  ProjectNode _updateNode(
    int id,
    ProjectNodeUpdateDto request,
  ) {
    final node = _nodes[id]!;
    final newNode = node.copyWith(
      name: request.name,
      order: request.order,
      parentNodeId: request.parentId,
      isOpened: request.isOpened,
    );
    _nodes[id] = newNode;
    return newNode;
  }

  @override
  ProjectNode parentNode(int id, int parentId, int order) {
    final nodeModel = getNode(id);

    final newSiblings = getNodeChildren(nodeModel.parentNodeId!);
    for (final sibling in newSiblings) {
      if (sibling.order >= order) {
        _updateNode(
          sibling.id,
          ProjectNodeUpdateDto(order: sibling.order + 1),
        );
      }
    }
    return _updateNode(
      id,
      ProjectNodeUpdateDto(parentId: parentId.nullable),
    );
  }

  @override
  ProjectNode unParentNode(int id) {
    final nodeModel = getNode(id);
    final oldOrder = nodeModel.order;
    final oldSiblings = getNodeChildren(nodeModel.parentNodeId!);
    for (final sibling in oldSiblings) {
      if (sibling.order > oldOrder) {
        _updateNode(
          sibling.id,
          ProjectNodeUpdateDto(order: sibling.order - 1),
        );
      }
    }
    return _updateNode(
      id,
      ProjectNodeUpdateDto(parentId: Nullable()),
    );
  }

  @override
  ProjectNode setIsOpened(int id, bool isOpened) {
    return _updateNode(
      id,
      ProjectNodeUpdateDto(isOpened: isOpened),
    );
  }
}
