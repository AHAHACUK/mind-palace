part of 'node_edit_cubit.dart';

sealed class NodeEditEffect {
  const NodeEditEffect._();

  const factory NodeEditEffect.success(Node node) =
      SuccessNodeEditEffectState._;
  const factory NodeEditEffect.error() = ErrorNodeEditEffectState._;
}

final class SuccessNodeEditEffectState extends NodeEditEffect {
  final Node node;
  const SuccessNodeEditEffectState._(this.node) : super._();
}

final class ErrorNodeEditEffectState extends NodeEditEffect {
  const ErrorNodeEditEffectState._() : super._();
}
