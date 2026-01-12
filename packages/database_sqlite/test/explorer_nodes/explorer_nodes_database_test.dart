import 'package:database_sqlite/explorer_nodes/explorer_nodes_database.dart';
import 'package:database_sqlite/explorer_nodes/tables/explorer_nodes_table.dart';
import 'package:test/test.dart';

void main() {
  final path = 'test.db';
  group('ExplorerNodeDatabase', () {
    test('should work with file', () async {
      final name = 'name';
      final db = ExplorerNodeDatabase(filename: path);
      await db.open();

      final id = await db.nodes.createNode(
        name: name,
        type: ExplorerNodeModelType.folder,
      );

      final model = await db.nodes.getNode(id);
      await db.delete();

      expect(model.name, name);
    });

    test('should read saved in file data', () async {
      final name = 'name';

      var db = ExplorerNodeDatabase(filename: path);
      await db.open();
      final id = await db.nodes.createNode(
        name: name,
        type: ExplorerNodeModelType.folder,
      );
      await db.close();

      db = ExplorerNodeDatabase(filename: path);
      await db.open();
      final model = await db.nodes.getNode(id);
      await db.delete();

      expect(model.name, name);
    });
  });
}
