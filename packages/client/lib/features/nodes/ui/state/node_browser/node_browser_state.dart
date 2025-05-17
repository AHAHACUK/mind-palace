part of 'node_browser_cubit.dart';

sealed class NodeBrowserState {
  const NodeBrowserState._();

  const factory NodeBrowserState.loading() = LoadingNodeBrowserState._;
  const factory NodeBrowserState.data({
    required List<NodeTreeState> rootNodes,
  }) = DataNodeBrowserState._;
  const factory NodeBrowserState.error() = ErrorNodeBrowserState._;
}

final class LoadingNodeBrowserState extends NodeBrowserState {
  const LoadingNodeBrowserState._() : super._();
}

final class DataNodeBrowserState extends NodeBrowserState {
  final List<NodeTreeState> rootNodes;

  const DataNodeBrowserState._({required this.rootNodes}) : super._();
}

final class ErrorNodeBrowserState extends NodeBrowserState {
  const ErrorNodeBrowserState._() : super._();
}

class NodeTreeState {
  final Node node;
  final List<NodeTreeState> children;
  final bool isOpened;

  int get id => node.id;
  String get name => node.name;

  NodeTreeState({
    required this.children,
    required this.isOpened,
    required this.node,
  });
}
