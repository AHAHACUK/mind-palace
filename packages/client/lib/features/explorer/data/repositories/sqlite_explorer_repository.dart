import 'package:database_sqlite/database_sqlite.dart';
import 'package:mind_palace/features/explorer/data/mappers/explorer_node_mapper.dart';
import 'package:mind_palace/features/explorer/domain/entities/explorer_node.dart';
import 'package:mind_palace/features/explorer/domain/entities/explorer_node_type.dart';
import 'package:mind_palace/features/explorer/domain/repositories/explorer_repository.dart';

class SqliteExplorerRepository implements ExplorerRepository {
  final ExplorerNodeDatabase _db;

  SqliteExplorerRepository({required ExplorerNodeDatabase db}) : _db = db;

  @override
  Future<int> createNode({
    required String name,
    required ExplorerNodeType type,
    int? parentId,
  }) async {
    return _db.nodes.createNode(name: name, type: type.toModel());
  }

  @override
  Future<ExplorerNode> getNode(int id) async {
    final model = await _db.nodes.getNode(id);
    return model.toEntity();
  }

  @override
  Future<List<ExplorerNode>> getNodeChildren(int id) async {
    final models = await _db.nodes.getNodeChildren(id);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ExplorerNode>> getRootNodes() async {
    final models = await _db.nodes.getRootNodes();
    return models.map((e) => e.toEntity()).toList();
  }
}
