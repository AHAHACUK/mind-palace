part of 'memory_project_node_cache_repository.dart';

extension ProjectNodeCopyExt on ProjectNode {
  ProjectNode copyWith({
    String? name,
    int? order,
    Nullable<int>? parentNodeId,
    bool? isOpened,
  }) {
    return ProjectNode(
      id: id,
      name: name ?? this.name,
      order: order ?? this.order,
      parentNodeId:
          parentNodeId != null ? parentNodeId.value : this.parentNodeId,
      isOpened: isOpened ?? this.isOpened,
    );
  }
}
