import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/entities/node_form.dart';
import 'package:client/features/nodes/domain/repositories/node_repository.dart';

class NodeInteractor {
  final NodeRepository _repository;

  NodeInteractor({required NodeRepository repository})
    : _repository = repository;

  Future<Node> createNode(NodeForm node) {
    return _repository.createNode(node);
  }

  Future<Node> updateNode(Node node) {
    return _repository.updateNode(node);
  }

  Future<List<Node>> getAllNodes() {
    return _repository.getAllNodes();
  }
}
