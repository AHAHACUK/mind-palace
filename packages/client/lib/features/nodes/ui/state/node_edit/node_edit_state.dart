part of 'node_edit_cubit.dart';

sealed class NodeEditState {
  final Node node;

  const NodeEditState._(this.node);

  const factory NodeEditState.idle(Node node) = IdleNodeEditState._;
  const factory NodeEditState.loading(Node node) = LoadingNodeEditState._;
  const factory NodeEditState.process(Node node) = ProcessNameNodeEditState._;
}

final class IdleNodeEditState extends NodeEditState {
  const IdleNodeEditState._(super.node) : super._();
}

final class ProcessNameNodeEditState extends NodeEditState {
  const ProcessNameNodeEditState._(super.node) : super._();
}

final class LoadingNodeEditState extends NodeEditState {
  const LoadingNodeEditState._(super.node) : super._();
}
