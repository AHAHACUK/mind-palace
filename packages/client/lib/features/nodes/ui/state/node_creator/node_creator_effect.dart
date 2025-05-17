part of 'node_creator_cubit.dart';

sealed class NodeCreatorEffect {
  const NodeCreatorEffect._();

  const factory NodeCreatorEffect.successCreate(Node node) =
      SuccessCreateNodeCreatorState._;
  const factory NodeCreatorEffect.successDelete(Node node) =
      SuccessDeleteNodeCreatorState._;
  const factory NodeCreatorEffect.error() = ErrorNodeCreatorState._;
}

final class SuccessCreateNodeCreatorState extends NodeCreatorEffect {
  final Node node;
  const SuccessCreateNodeCreatorState._(this.node) : super._();
}

final class SuccessDeleteNodeCreatorState extends NodeCreatorEffect {
  final Node node;
  const SuccessDeleteNodeCreatorState._(this.node) : super._();
}

final class ErrorNodeCreatorState extends NodeCreatorEffect {
  const ErrorNodeCreatorState._() : super._();
}
