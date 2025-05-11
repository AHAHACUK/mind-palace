part of 'node_creator_cubit.dart';

sealed class NodeCreatorState {
  const NodeCreatorState._();

  const factory NodeCreatorState.idle() = IdleNodeCreatorState._;
  const factory NodeCreatorState.loading({required int? parentId}) =
      LoadingNodeCreatorState._;
}

final class IdleNodeCreatorState extends NodeCreatorState {
  const IdleNodeCreatorState._() : super._();
}

final class LoadingNodeCreatorState extends NodeCreatorState {
  final int? parentId;
  const LoadingNodeCreatorState._({required this.parentId}) : super._();
}
