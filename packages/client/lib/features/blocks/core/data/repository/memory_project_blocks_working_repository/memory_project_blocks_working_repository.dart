import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_working_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

class MemoryProjectBlocksWorkingRepository
    implements ProjectBlockWorkingRepository {
  final Map<int, ProjectBlock> _blocks = {};

  @override
  List<ProjectBlock> getBlocks() {
    return _blocks.values.toList();
  }

  @override
  List<ProjectBlock> getBlocksForNode(ProjectNode node) {
    return _blocks.values.where((e) => e.parentNodeId == node.id).toList();
  }

  @override
  void setBlocks(List<ProjectBlock> blocks) {
    _blocks.clear();
    _blocks.addEntries(blocks.map((e) => MapEntry(e.id, e)));
  }
}
