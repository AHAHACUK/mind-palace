import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_json_storage/storages/nodes/view_models/project_tree_node.dart';

extension ProjectTreeNodeParser on ProjectTreeNode {
  ProjectNode toEntity() {
    return ProjectNode(
      id: node.id,
      name: node.name,
      subNodes: subNodes
          .map(
            (e) => e.toEntity(),
          )
          .toList(),
    );
  }
}
