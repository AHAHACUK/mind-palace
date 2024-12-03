import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

sealed class ProjectRootState {
  const ProjectRootState();
}

class LoadingProjectRootState extends ProjectRootState {
  const LoadingProjectRootState();
}

class ViewingProjectRootState extends ProjectRootState {
  final ProjectNode rootNode;
  final List<int> rootChildrenIds;

  const ViewingProjectRootState({
    required this.rootNode,
    required this.rootChildrenIds,
  });
}
