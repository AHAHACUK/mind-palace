import 'dart:io';

import 'package:database_sqlite/explorer_nodes/tables/explorer_nodes_table.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ExplorerNodeDatabase {
  final String filename;
  late final Database _db;
  late final ExplorerNodesTable nodes;

  ExplorerNodeDatabase({required this.filename});

  Future<void> open() async {
    databaseFactory = databaseFactoryFfi;
    _db = await openDatabase(filename);

    nodes = ExplorerNodesTable(db: _db);

    await nodes.init();
  }

  Future<void> close() async {
    await _db.close();
  }

  Future<void> delete() async {
    final file = File(_db.path);
    await close();
    await file.delete();
  }
}
