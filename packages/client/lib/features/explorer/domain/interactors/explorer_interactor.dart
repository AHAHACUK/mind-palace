import 'package:mind_palace/features/explorer/domain/entities/explorer_node.dart';
import 'package:mind_palace/features/explorer/domain/entities/explorer_node_type.dart';
import 'package:mind_palace/features/explorer/domain/repositories/explorer_repository.dart';

class ExplorerInteractor {
  final ExplorerRepository _rep;

  ExplorerInteractor({required ExplorerRepository rep}) : _rep = rep;

  Future<List<ExplorerNode>> getRootNodes() {
    return _rep.getRootNodes();
  }

  Future<int> createNode({
    required String name,
    required ExplorerNodeType type,
    int? parentId,
  }) {
    return _rep.createNode(name: name, type: type);
  }

  Future<ExplorerNode> getNode(int id) {
    return _rep.getNode(id);
  }

  Future<List<ExplorerNode>> getNodeChildren(int id) {
    return _rep.getNodeChildren(id);
  }
}
