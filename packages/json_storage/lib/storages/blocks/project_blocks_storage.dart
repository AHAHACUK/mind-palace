import 'package:mind_palace_json_storage/core/models/project_model.dart';
import 'package:mind_palace_json_storage/storages/blocks/models/project_block_model.dart';

class ProjectBlocksStorage {
  final ProjectModel _project;

  ProjectBlocksStorage({
    required ProjectModel project,
  }) : _project = project;

  List<ProjectBlockModel> getBlocksForNode(int nodeId) {
    return _project.blocks.values
        .where((e) => e.parentNodeId == nodeId)
        .toList();
  }
}
