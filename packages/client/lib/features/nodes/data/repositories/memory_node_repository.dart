import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/entities/node_form.dart';
import 'package:client/features/nodes/domain/repositories/node_repository.dart';

class MemoryNodeRepository implements NodeRepository {
  final Map<int, Node> _nodes = {};

  @override
  Future<Node> createNode(NodeForm form) async {
    final id = _getFirstFreeId();
    final node = Node(id: id, name: form.name, parentNodeId: form.parentNodeId);
    _nodes[id] = node;
    return node;
  }

  @override
  Future<Node> updateNode(Node node) async {
    _nodes[node.id] = node;
    return node;
  }

  @override
  Future<void> deleteNode(Node nodeToDelete) async {
    final Set<int> nodesToDelete = {
      nodeToDelete.id,
      ..._findChildren(nodeToDelete).map((e) => e.id),
    };
    for (final id in nodesToDelete) {
      _nodes.remove(id);
    }
  }

  Set<Node> _findChildren(Node parent) {
    final set = <Node>{};
    for (final node in _nodes.values) {
      if (node.parentNodeId == parent.id) {
        set.add(node);
        set.addAll(_findChildren(node));
      }
    }
    return set;
  }

  @override
  Future<List<Node>> getAllNodes() async {
    return _nodes.values.toList();
  }

  int _getFirstFreeId() {
    for (var i = 0; i < _nodes.length; i++) {
      final node = _nodes[i];
      if (node == null) return i;
    }
    return _nodes.length;
  }
}
