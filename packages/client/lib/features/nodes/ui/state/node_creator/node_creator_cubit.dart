import 'package:bloc_effects/bloc_effects.dart';
import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/entities/node_form.dart';
import 'package:client/features/nodes/domain/interactor/node_interactor.dart';

part 'node_creator_state.dart';
part 'node_creator_effect.dart';

class NodeCreatorCubit
    extends CubitWithEffects<NodeCreatorState, NodeCreatorEffect> {
  final NodeInteractor _nodeInteractor;

  NodeCreatorCubit({required NodeInteractor nodeInteractor})
    : _nodeInteractor = nodeInteractor,
      super(NodeCreatorState.idle());

  void createNode({required String name, required int? parentId}) async {
    emit(NodeCreatorState.loading(parentId: parentId));
    try {
      final form = NodeForm(name: name, parentNodeId: parentId);
      final node = await _nodeInteractor.createNode(form);
      emitEffect(NodeCreatorEffect.success(node));
    } catch (_) {
      emitEffect(const NodeCreatorEffect.error());
    } finally {
      emit(const NodeCreatorState.idle());
    }
  }
}
