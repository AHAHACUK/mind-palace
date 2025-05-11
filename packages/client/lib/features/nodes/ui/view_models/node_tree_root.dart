import 'package:client/features/nodes/ui/view_models/node_tree.dart';

class NodeTreeRoot {
  final List<NodeTree> rootNodes;

  NodeTreeRoot({required this.rootNodes});

  const NodeTreeRoot.empty() : rootNodes = const [];
}
