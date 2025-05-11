import 'package:client/features/nodes/domain/entities/node.dart';

class NodeTree {
  final Node node;
  final List<NodeTree> children;

  int get id => node.id;

  NodeTree({required this.node, required this.children});
}
