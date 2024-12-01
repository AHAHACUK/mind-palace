import 'package:mind_palace_json_storage/storages/nodes/models/project_node_model.dart';

class ProjectTreeNode {
  final ProjectNodeModel node;
  final List<ProjectTreeNode> subNodes;

  const ProjectTreeNode({
    required this.node,
    required this.subNodes,
  });

  static List<ProjectTreeNode> fromProjectNodes(
    Map<int, ProjectNodeModel> nodes,
  ) {
    final roots = <int>{};
    final children = <int, Set<int>>{};
    for (final node in nodes.values) {
      final id = node.id;
      final parentNodeId = node.parentNodeId;
      if (parentNodeId == null) {
        roots.add(id);
        continue;
      }
      final parentChildren = children[parentNodeId];
      if (parentChildren == null) {
        children[parentNodeId] = {id};
      } else {
        parentChildren.add(id);
      }
    }

    final rootNodes = roots.map((e) => _stack(e, children, nodes)).toList();
    return rootNodes;
  }

  static ProjectTreeNode _stack(
    int id,
    Map<int, Set<int>> children,
    Map<int, ProjectNodeModel> folders,
  ) {
    final subFolders = children[id]!
        .map(
          (e) => _stack(e, children, folders),
        )
        .toList();
    return ProjectTreeNode(
      node: folders[id]!,
      subNodes: subFolders,
    );
  }
}
