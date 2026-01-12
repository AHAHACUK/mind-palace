import 'package:database_sqlite/explorer_nodes/tables/explorer_nodes_table.dart';
import 'package:mind_palace/features/explorer/domain/entities/explorer_node.dart';
import 'package:mind_palace/features/explorer/domain/entities/explorer_node_type.dart';

extension ExplorerNodeModelMapper on ExplorerNodeModel {
  ExplorerNode toEntity() {
    return ExplorerNode(id: id, name: name, type: type.toEntity());
  }
}

extension ExplorerNodeTypeModelMapper on ExplorerNodeModelType {
  ExplorerNodeType toEntity() {
    return switch (this) {
      ExplorerNodeModelType.folder => ExplorerNodeType.folder,
      ExplorerNodeModelType.text => ExplorerNodeType.text,
    };
  }
}

extension ExplorerNodeTypeMapper on ExplorerNodeType {
  ExplorerNodeModelType toModel() {
    return switch (this) {
      ExplorerNodeType.folder => ExplorerNodeModelType.folder,
      ExplorerNodeType.text => ExplorerNodeModelType.text,
    };
  }
}
