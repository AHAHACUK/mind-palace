import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/domain/interactor/node_interactor.dart';
import 'package:client/features/nodes/ui/interactor/node_tree_interactor.dart';
import 'package:client/features/nodes/ui/view_models/node_tree_root.dart';
import 'package:client/features/nodes/ui/view_models/node_tree.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'node_browser_state.dart';

class NodeBrowserCubit extends Cubit<NodeBrowserState> {
  final NodeTreeInteractor _nodeTreeInteractor = NodeTreeInteractor();
  final NodeInteractor _nodeInteractor;

  late NodeTreeRoot _nodeTreeRoot;
  final Map<int, _NodeState> _nodeStates = {};

  NodeBrowserCubit({required NodeInteractor nodeInteractor})
    : _nodeInteractor = nodeInteractor,
      super(NodeBrowserState.data(rootNodes: const []));

  void fetchStructureAll() async {
    try {
      final nodes = await _nodeInteractor.getAllNodes();
      _nodeTreeRoot = _nodeTreeInteractor.buildFromRootNodes(nodes);
      _updateStateAll();
    } catch (e) {
      emit(NodeBrowserState.error());
      rethrow;
    }
  }

  void _updateStateAll() {
    final rootNodes = _nodeTreeRoot.rootNodes;
    final state = rootNodes.map((e) => _buildTreeState(e)).toList();
    emit(NodeBrowserState.data(rootNodes: state));
  }

  void setIsOpened(int nodeId, bool isOpened) {
    final state = _getOrCreateState(nodeId);
    _nodeStates[nodeId] = state.copyWith(isOpened: isOpened);
  }

  NodeTreeState _buildTreeState(NodeTree nodeTree) {
    final state = _getOrCreateState(nodeTree.id);
    final children = nodeTree.children.map((e) => _buildTreeState(e)).toList();
    return NodeTreeState(
      node: nodeTree.node,
      isOpened: state.isOpened,
      children: children,
    );
  }

  _NodeState _getOrCreateState(int nodeId) {
    final state = _nodeStates[nodeId];
    if (state == null) {
      final newState = _NodeState(isOpened: false);
      _nodeStates[nodeId] = newState;
      return newState;
    } else {
      return state;
    }
  }
}

class _NodeState {
  final bool isOpened;

  _NodeState({required this.isOpened});

  _NodeState copyWith({bool? isOpened}) {
    return _NodeState(isOpened: isOpened ?? this.isOpened);
  }
}
