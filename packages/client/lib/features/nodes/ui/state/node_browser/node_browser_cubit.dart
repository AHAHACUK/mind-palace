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
      super(NodeBrowserState.data(rootNodes: const [])) {
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

  void _onNodeChange() {
    fetchStructureAll();
  }

  void fetchStructureAll() async {
    try {
      final nodes = await _nodeInteractor.getAllNodes();
      _nodeTreeRoot = _nodeTreeInteractor.buildFromRootNodes(nodes);
      _updateStateMap(nodes);
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
    final state = _nodeStates[nodeId]!;
    _nodeStates[nodeId] = state.copyWith(isOpened: isOpened);
    _updateStateAll();
  }

  void setIsOpenedForAll(bool isOpened) {
    for (final key in _nodeStates.keys) {
      final state = _nodeStates[key]!;
      _nodeStates[key] = state.copyWith(isOpened: isOpened);
    }
    _updateStateAll();
  }

  NodeTreeState _buildTreeState(NodeTree nodeTree) {
    final state = _nodeStates[nodeTree.id]!;
    final children = nodeTree.children.map((e) => _buildTreeState(e)).toList();
    return NodeTreeState(
      node: nodeTree.node,
      isOpened: state.isOpened,
      children: children,
    );
  }

  _NodeState _initialState() {
    return _NodeState(isOpened: true);
  }

  void _updateStateMap(List<Node> node) {
    final nodeIds = node.map((e) => e.id).toSet();
    final stateIds = _nodeStates.keys.toSet();
    for (final nodeId in stateIds) {
      if (!nodeIds.contains(nodeId)) {
        _nodeStates.remove(nodeId);
      }
    }
    for (final nodeId in nodeIds) {
      if (!stateIds.contains(nodeId)) {
        _nodeStates[nodeId] = _initialState();
      }
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
