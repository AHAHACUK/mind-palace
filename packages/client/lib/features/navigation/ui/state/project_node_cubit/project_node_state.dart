import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

sealed class ProjectNodeState {
  const ProjectNodeState();
}

final class LoadingProjectNodeState extends ProjectNodeState {
  const LoadingProjectNodeState();
}

final class ViewingProjectNodeState extends ProjectNodeState {
  final ProjectNode node;
  final List<int> nodeChildrenIds;

  const ViewingProjectNodeState({
    required this.node,
    required this.nodeChildrenIds,
  });
}
