class ProjectNode {
  final int id;
  final String name;
  final int order;
  final int? parentNodeId;
  final bool isOpened;

  bool get isRoot => parentNodeId == null;

  const ProjectNode({
    required this.id,
    required this.name,
    required this.order,
    required this.parentNodeId,
    required this.isOpened,
  });
}
