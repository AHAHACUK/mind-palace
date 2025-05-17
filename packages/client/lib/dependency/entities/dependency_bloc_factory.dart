import 'package:client/features/nodes/domain/interactor/node_interactor.dart';
import 'package:client/features/nodes/ui/state/node_browser/node_browser_cubit.dart';
import 'package:client/features/nodes/ui/state/node_creator/node_creator_cubit.dart';
import 'package:client/features/nodes/ui/state/node_edit/node_edit_cubit.dart';

class DependencyBlocFactory {
  final NodeInteractor _nodeInteractor;

  DependencyBlocFactory({required NodeInteractor nodeInteractor})
    : _nodeInteractor = nodeInteractor;

  NodeBrowserCubit nodeBrowser() {
    return NodeBrowserCubit(nodeInteractor: _nodeInteractor);
  }

  NodeCreatorCubit nodeCreator() {
    return NodeCreatorCubit(nodeInteractor: _nodeInteractor);
  }

  NodeEditCubit nodeEdit() {
    return NodeEditCubit(nodeInteractor: _nodeInteractor);
  }
}
