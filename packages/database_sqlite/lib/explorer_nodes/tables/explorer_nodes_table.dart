import 'package:sqflite_common_ffi/sqflite_ffi.dart';

part 'explorer_node_model.dart';

class ExplorerNodesTable {
  static const _tableName = 'explorer_node';
  static const _idField = 'id';
  static const _parentIdField = 'parent_id';
  static const _nameField = 'name';
  static const _typeField = 'type';

  final Database db;

  ExplorerNodesTable({required this.db});

  static ExplorerNodeModel _parse(Map<String, Object?> map) {
    final typeIndex = map[_typeField] as int;
    final type = ExplorerNodeModelType.values[typeIndex];
    return ExplorerNodeModel(
      id: map[_idField] as int,
      name: map[_nameField] as String,
      type: type,
    );
  }

  Future<void> init() async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_tableName (
        $_idField INTEGER PRIMARY KEY,
        $_parentIdField INTEGER,
        $_nameField TEXT NOT NULL,
        $_typeField INTEGER NOT NULL
      );
    ''');
  }

  Future<int> createNode({
    required String name,
    required ExplorerNodeModelType type,
    int? parentId,
  }) async {
    return db.insert(_tableName, {
      _nameField: name,
      _typeField: type.index,
      if (parentId != null) _parentIdField: parentId,
    });
  }

  Future<ExplorerNodeModel> getNode(int id) async {
    final items = await db.rawQuery(
      'SELECT * from $_tableName WHERE $_idField = $id',
    );
    final item = items.first;
    return _parse(item);
  }

  Future<List<ExplorerNodeModel>> getNodeChildren(int id) async {
    final items = await db.rawQuery(
      'SELECT * from $_tableName WHERE $_parentIdField = $id',
    );
    return items.map((e) => _parse(e)).toList();
  }

  Future<List<ExplorerNodeModel>> getRootNodes() async {
    final items = await db.rawQuery(
      'SELECT * from $_tableName WHERE $_parentIdField IS NULL',
    );
    return items.map((e) => _parse(e)).toList();
  }

  Future<int> updateNode(int id, {String? name, int? parentId}) async {
    return db.update(_tableName, {
      if (name != null) _nameField: name,
      if (parentId != null) _parentIdField: parentId,
    }, where: '$_idField = $id');
  }
}
