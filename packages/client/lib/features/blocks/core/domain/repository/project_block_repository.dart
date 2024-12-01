import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

abstract class ProjectBlockRepository {
  List<ProjectBlock> getBlocksForNode(ProjectNode node);
}
