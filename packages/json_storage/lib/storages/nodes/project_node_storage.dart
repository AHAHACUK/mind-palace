import 'package:mind_palace_json_storage/core/models/project_model.dart';
import 'package:mind_palace_json_storage/storages/nodes/models/project_node_model.dart';
import 'package:mind_palace_json_storage/storages/nodes/requests/project_node_update_model.dart';
import 'package:mind_palace_json_storage/storages/nodes/view_models/project_tree_node.dart';
import 'package:mind_palace_json_storage/utils/nullable.dart';

class ProjectNodesStorage {
  final ProjectModel _project;

  const ProjectNodesStorage({required ProjectModel project})
      : _project = project;

  List<ProjectTreeNode> getNodesTrees() {
    return ProjectTreeNode.fromProjectNodes(_project.nodes);
  }

  List<ProjectNodeModel> _getRootNodes() {
    return _project.nodes.values.where((e) => e.parentNodeId == null).toList();
  }

  List<ProjectNodeModel> _getNodeChildren(int id) {
    return _project.nodes.values.where((e) => e.parentNodeId == id).toList();
  }

  ProjectNodeModel _getNode(
    int id,
  ) {
    final node = _project.nodes[id]!;
    return node;
  }

  void updateNode(
    int id,
    ProjectNodeUpdateModel update,
  ) {
    final node = _project.nodes[id]!;
    _project.nodes[id] = node.copyWith(
      name: update.name,
      order: update.order,
      parentNodeId: update.parentNodeId,
    );
  }

  void updateNodePosition(
    int id,
    int? newParentId,
    int newOrder,
  ) {
    final nodeModel = _getNode(id);
    final oldOrder = nodeModel.order;
    final oldParentId = nodeModel.parentNodeId;
    final parentChanged = newParentId != oldParentId;
    final orderChanged = newOrder != nodeModel.order;
    if (!parentChanged && !orderChanged) {
      return;
    }

    final List<ProjectNodeModel> oldSiblings;
    final List<ProjectNodeModel> newSiblings;
    if (oldParentId == null) {
      oldSiblings = _getRootNodes();
    } else {
      oldSiblings = _getNodeChildren(nodeModel.parentNodeId!);
    }
    if (newParentId == oldParentId) {
      newSiblings = oldSiblings;
    } else if (newParentId == null) {
      newSiblings = _getRootNodes();
    } else {
      newSiblings = _getNodeChildren(nodeModel.parentNodeId!);
    }
    for (final sibling in oldSiblings) {
      if (sibling.order > oldOrder) {
        updateNode(
          sibling.id,
          ProjectNodeUpdateModel(order: sibling.order - 1),
        );
      }
    }
    for (final sibling in newSiblings) {
      if (sibling.order >= newOrder) {
        updateNode(
          sibling.id,
          ProjectNodeUpdateModel(order: sibling.order + 1),
        );
      }
    }

    updateNode(
      id,
      ProjectNodeUpdateModel(parentNodeId: newParentId.nullable),
    );
  }
}
