part of 'project_node_working_repository.dart';

class ProjectNodeCreateDto {
  final String name;
  final int order;
  final int parentId;
  final bool isOpened;

  const ProjectNodeCreateDto({
    required this.name,
    required this.order,
    required this.parentId,
    required this.isOpened,
  });
}

class ProjectNodeUpdateDto {
  final String? name;
  final int? order;
  final Nullable<int>? parentId;
  final bool? isOpened;

  const ProjectNodeUpdateDto({
    this.name,
    this.order,
    this.parentId,
    this.isOpened,
  });
}
