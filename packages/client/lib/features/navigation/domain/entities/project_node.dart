class ProjectNode {
  final int id;
  final String name;
  final List<ProjectNode> subNodes;

  const ProjectNode({
    required this.id,
    required this.name,
    required this.subNodes,
  });
}
