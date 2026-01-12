import 'package:mind_palace/features/explorer/domain/entities/explorer_node.dart';
import 'package:mind_palace/features/explorer/domain/entities/explorer_node_type.dart';

abstract class ExplorerRepository {
  Future<List<ExplorerNode>> getRootNodes();

  Future<int> createNode({
    required String name,
    required ExplorerNodeType type,
    int? parentId,
  });

  Future<ExplorerNode> getNode(int id);

  Future<List<ExplorerNode>> getNodeChildren(int id);
}
