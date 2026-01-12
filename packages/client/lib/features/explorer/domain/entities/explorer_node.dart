import 'package:mind_palace/features/explorer/domain/entities/explorer_node_type.dart';

class ExplorerNode {
  final int id;
  final String name;
  final ExplorerNodeType type;

  ExplorerNode({required this.id, required this.name, required this.type});
}
