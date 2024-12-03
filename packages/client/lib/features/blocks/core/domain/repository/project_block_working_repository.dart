import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

abstract class ProjectBlockWorkingRepository {
  void setBlocks(List<ProjectBlock> blocks);

  List<ProjectBlock> getBlocks();

  List<ProjectBlock> getBlocksForNode(ProjectNode node);
}
