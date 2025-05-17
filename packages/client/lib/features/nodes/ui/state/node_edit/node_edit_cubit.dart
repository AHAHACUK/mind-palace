import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/interactor/node_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'node_edit_effect.dart';
part 'node_edit_state.dart';

class NodeEditCubit extends Cubit<NodeEditState> {
  final NodeInteractor _nodeInteractor;

  Node? editingNode;

  NodeEditCubit({required NodeInteractor nodeInteractor})
    : _nodeInteractor = nodeInteractor,
      super(NodeEditState.idle()) {
    init();
  }

  void init() {
    _nodeInteractor.addListener(_onNodeChange);
  }

  @override
  Future<void> close() {
    _nodeInteractor.removeListener(_onNodeChange);

    return super.close();
  }

  void _onNodeChange() async {
    if (editingNode == null) return;
    final nodes = await _nodeInteractor.getAllNodes();
    final nodeIds = nodes.map((e) => e.id).toSet();
    if (!nodeIds.contains(editingNode!.id)) {
      cancelEditing();
    }
  }

  void startEditing(Node node) async {
    editingNode = node;
    emit(NodeEditState.editing(node));
  }

  void finishEditing({required String name}) async {
    emit(NodeEditState.loading());
    await _nodeInteractor.updateNode(editingNode!.copyWith(name: name));
    editingNode = null;
    emit(NodeEditState.idle());
  }

  /// Finish editing without applying changes
  void cancelEditing() async {
    editingNode = null;
    emit(NodeEditState.idle());
  }
}
