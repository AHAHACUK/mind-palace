import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/entities/node_form.dart';
import 'package:client/features/nodes/domain/repositories/node_repository.dart';
import 'package:flutter/widgets.dart';

class NodeInteractor extends ChangeNotifier {
  final NodeRepository _repository;

  NodeInteractor({required NodeRepository repository})
    : _repository = repository;

  Future<Node> createNode(NodeForm node) {
    try {
      return _repository.createNode(node);
    } finally {
      notifyListeners();
    }
  }

  Future<Node> updateNode(Node node) {
    try {
      return _repository.updateNode(node);
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteNode(Node node) {
    try {
      return _repository.deleteNode(node);
    } finally {
      notifyListeners();
    }
  }

  Future<List<Node>> getAllNodes() {
    try {
      return _repository.getAllNodes();
    } finally {}
  }
}
