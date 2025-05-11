import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/interactor/node_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'node_edit_effect.dart';
part 'node_edit_state.dart';

class NodeEditCubit extends Cubit<NodeEditState> {
  final NodeInteractor _nodeInteractor;

  Node node;

  NodeEditCubit({required NodeInteractor nodeInteractor, required this.node})
    : _nodeInteractor = nodeInteractor,
      super(NodeEditState.idle(node));

  void startEditing() async {
    emit(NodeEditState.process(node));
  }

  void finishEditingName(String name) async {
    emit(NodeEditState.loading(node));
    final newNode = await _nodeInteractor.updateNode(node.copyWith(name: name));
    node = newNode;
    emit(NodeEditState.idle(newNode));
  }
}
