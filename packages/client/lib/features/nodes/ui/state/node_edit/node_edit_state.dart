part of 'node_edit_cubit.dart';

sealed class NodeEditState {
  const NodeEditState._();

  const factory NodeEditState.idle() = IdleNodeEditState._;
  const factory NodeEditState.loading() = LoadingNodeEditState._;
  const factory NodeEditState.editing(Node node) = EditingNodeEditState._;
}

final class IdleNodeEditState extends NodeEditState {
  const IdleNodeEditState._() : super._();
}

final class EditingNodeEditState extends NodeEditState {
  final Node node;
  const EditingNodeEditState._(this.node) : super._();
}

final class LoadingNodeEditState extends NodeEditState {
  const LoadingNodeEditState._() : super._();
}
