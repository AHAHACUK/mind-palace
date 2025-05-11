part of 'node_creator_cubit.dart';

sealed class NodeCreatorEffect {
  const NodeCreatorEffect._();

  const factory NodeCreatorEffect.success(Node node) = SuccessNodeCreatorState._;
  const factory NodeCreatorEffect.error() = ErrorNodeCreatorState._;
}

final class SuccessNodeCreatorState extends NodeCreatorEffect {
  final Node node;
  const SuccessNodeCreatorState._(this.node) : super._();
}

final class ErrorNodeCreatorState extends NodeCreatorEffect {
  const ErrorNodeCreatorState._() : super._();
}
