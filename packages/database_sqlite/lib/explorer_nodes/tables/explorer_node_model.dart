part of 'explorer_nodes_table.dart';

class ExplorerNodeModel {
  final int id;
  final int? parentId;
  final String name;
  final ExplorerNodeModelType type;

  ExplorerNodeModel({
    required this.id,
    this.parentId,
    required this.name,
    required this.type,
  });
}

enum ExplorerNodeModelType { folder, text }
