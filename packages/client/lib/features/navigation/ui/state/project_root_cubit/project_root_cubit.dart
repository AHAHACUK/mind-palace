import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_palace_client/features/navigation/domain/interactor/project_node_interactor.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_root_cubit/project_root_state.dart';

class ProjectRootCubit extends Cubit<ProjectRootState> {
  final ProjectNodeInteractor _nodeInteractor;

  ProjectRootCubit({
    required ProjectNodeInteractor nodeInteractor,
  })  : _nodeInteractor = nodeInteractor,
        super(
          const LoadingProjectRootState(),
        );

  void update() async {
    final rootNode = _nodeInteractor.getRootNode();
    final rootChildren = _nodeInteractor.getNodeChildren(rootNode.id);
    final rootChildrenIds = rootChildren.map((e) => e.id).toList();
    emit(
      ViewingProjectRootState(
        rootNode: rootNode,
        rootChildrenIds: rootChildrenIds,
      ),
    );
  }
}
