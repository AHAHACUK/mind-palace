import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_palace_client/features/navigation/domain/interactor/project_node_interactor.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_node_cubit/project_node_state.dart';

class ProjectNodeCubit extends Cubit<ProjectNodeState> {
  final int id;
  final ProjectNodeInteractor _nodeInteractor;

  ProjectNodeCubit({
    required ProjectNodeInteractor nodeInteractor,
    required this.id,
  })  : _nodeInteractor = nodeInteractor,
        super(const LoadingProjectNodeState());

  void update() async {
    final node = _nodeInteractor.getNode(id);
    final children = _nodeInteractor.getNodeChildren(id);
    final childrenIds = children.map((e) => e.id).toList();
    emit(
      ViewingProjectNodeState(
        node: node,
        nodeChildrenIds: childrenIds,
      ),
    );
  }

  void setIsOpened(bool isOpened) async {
    _nodeInteractor.setIsOpened(id, isOpened);
  }
}
