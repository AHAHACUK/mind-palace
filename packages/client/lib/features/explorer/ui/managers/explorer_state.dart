import 'package:flutter_bloc/flutter_bloc.dart';

part 'explorer_cubit.dart';

abstract class ExplorerState {
  const ExplorerState._();

  const factory ExplorerState.loading() = LoadingExplorerState._;
  const factory ExplorerState.success() = SuccessExplorerState._;
  const factory ExplorerState.error() = ErrorExplorerState._;
}

final class LoadingExplorerState extends ExplorerState {
  const LoadingExplorerState._() : super._();
}

final class SuccessExplorerState extends ExplorerState {
  const SuccessExplorerState._() : super._();
}

final class ErrorExplorerState extends ExplorerState {
  const ErrorExplorerState._() : super._();
}
