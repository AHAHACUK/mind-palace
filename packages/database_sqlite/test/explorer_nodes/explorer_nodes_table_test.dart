import 'package:database_sqlite/explorer_nodes/explorer_nodes_database.dart';
import 'package:database_sqlite/explorer_nodes/tables/explorer_nodes_table.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  group('ExplorerNodesTable', () {
    late ExplorerNodeDatabase db;
    setUp(() async {
      db = ExplorerNodeDatabase(filename: inMemoryDatabasePath);
      await db.open();
    });

    tearDown(() async {
      await db.close();
    });

    test('should be able to create node', () async {
      await db.nodes.createNode(
        name: 'test1',
        type: ExplorerNodeModelType.folder,
      );
    });

    test('should be able to view node', () async {
      final name = 'test1';
      final id = await db.nodes.createNode(
        name: name,
        type: ExplorerNodeModelType.folder,
      );

      final model = await db.nodes.getNode(id);

      expect(model.id, id);
      expect(model.name, name);
    });

    test('should be able to view node\'s children', () async {
      final name3 = 'test3';
      final id1 = await db.nodes.createNode(
        name: 'test1',
        type: ExplorerNodeModelType.folder,
      );
      final _ = await db.nodes.createNode(
        name: 'test2',
        type: ExplorerNodeModelType.folder,
      );
      final id3 = await db.nodes.createNode(
        name: name3,
        type: ExplorerNodeModelType.folder,
        parentId: id1,
      );

      final models = await db.nodes.getNodeChildren(id1);

      expect(models.length, 1);
      expect(models.first.id, id3);
      expect(models.first.name, name3);
    });

    test('should be able to update node name', () async {
      final name1 = 'test1';
      final name2 = 'test2';
      final id = await db.nodes.createNode(
        name: name1,
        type: ExplorerNodeModelType.folder,
      );

      final _ = await db.nodes.updateNode(id, name: name2);
      final model = await db.nodes.getNode(id);

      expect(model.id, id);
      expect(model.name, name2);
    });

    test('should be able to view root nodes', () async {
      final name1 = 'test1';
      final name2 = 'test2';
      final id1 = await db.nodes.createNode(
        name: name1,
        type: ExplorerNodeModelType.folder,
      );
      final id2 = await db.nodes.createNode(
        name: name2,
        type: ExplorerNodeModelType.folder,
      );
      final _ = await db.nodes.createNode(
        name: 'test3',
        type: ExplorerNodeModelType.folder,
        parentId: id1,
      );

      final models = await db.nodes.getRootNodes();

      expect(models.length, 2);
      expect(models.map((e) => e.id), [id1, id2]);
      expect(models.map((e) => e.name), [name1, name2]);
    });
  });
}
