import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/ui/view_models/node_tree_root.dart';
import 'package:client/features/nodes/ui/view_models/node_tree.dart';

class NodeTreeInteractor {
  NodeTreeRoot buildFromRootNodes(List<Node> nodes) {
    final nodeMap = <int, Node>{};
    for (final node in nodes) {
      nodeMap[node.id] = node;
    }
    final rootNodes = <Node>{};
    final nodeChildrenMap = <int, Set<Node>>{};
    for (final node in nodes) {
      if (node.isRoot) {
        rootNodes.add(node);
        continue;
      }
      final childrenSet = nodeChildrenMap[node.parentNodeId!];
      if (childrenSet == null) {
        nodeChildrenMap[node.parentNodeId!] = {node};
      } else {
        childrenSet.add(node);
      }
    }
    final rootTreeNodes =
        rootNodes
            .map((e) => _buildTreeForNode(e, nodeChildrenMap: nodeChildrenMap))
            .toList();
    return NodeTreeRoot(rootNodes: rootTreeNodes);
  }

  NodeTree _buildTreeForNode(
    Node node, {
    required Map<int, Set<Node>> nodeChildrenMap,
  }) {
    final children = nodeChildrenMap[node.id];
    final childrenViewModels =
        children
            ?.map((e) => _buildTreeForNode(e, nodeChildrenMap: nodeChildrenMap))
            .toList();
    return NodeTree(node: node, children: childrenViewModels ?? const []);
  }
}
