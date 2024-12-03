import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';

abstract class ProjectBlockStorageRepository {
  Future<List<ProjectBlock>> getBlocks();

  Future<void> save(List<ProjectBlock> projectBlocks);
}
