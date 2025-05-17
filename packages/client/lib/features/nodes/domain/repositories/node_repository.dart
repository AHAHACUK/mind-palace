import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/entities/node_form.dart';

abstract class NodeRepository {
  Future<Node> createNode(NodeForm node);

  Future<Node> updateNode(Node node);

  Future<void> deleteNode(Node node);

  Future<List<Node>> getAllNodes();
}
