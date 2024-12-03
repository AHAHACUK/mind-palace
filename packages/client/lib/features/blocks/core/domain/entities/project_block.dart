abstract class ProjectBlock {
  final int id;
  final int order;
  final int parentNodeId;

  const ProjectBlock({
    required this.id,
    required this.order,
    required this.parentNodeId,
  });
}
