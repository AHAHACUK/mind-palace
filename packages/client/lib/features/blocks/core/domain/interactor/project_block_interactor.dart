import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_working_repository.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_storage_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

class ProjectBlockInteractor {
  final ProjectBlockStorageRepository _storage;
  final ProjectBlockWorkingRepository _working;

  const ProjectBlockInteractor({
    required ProjectBlockWorkingRepository working,
    required ProjectBlockStorageRepository storage,
  })  : _storage = storage,
        _working = working;

  Future<void> init() async {
    final blocks = await _storage.getBlocks();
    _working.setBlocks(blocks);
  }

  List<ProjectBlock> getBlocksForNode(ProjectNode node) {
    return _working.getBlocksForNode(node);
  }

  Future<void> save() async {
    final blocks = _working.getBlocks();
    await _storage.save(blocks);
  }
}
