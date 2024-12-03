import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_json_storage/core/models/project_node_model.dart';

extension ProjectNodeModelParser on ProjectNodeModel {
  ProjectNode toEntity() {
    return ProjectNode(
      id: id,
      name: name,
      order: order,
      parentNodeId: parentNodeId,
      isOpened: isOpened,
    );
  }
}

extension ProjectNodeModelConverter on ProjectNode {
  ProjectNodeModel toModel() {
    return ProjectNodeModel(
      id: id,
      name: name,
      order: order,
      parentNodeId: parentNodeId,
      isOpened: isOpened,
    );
  }
}
