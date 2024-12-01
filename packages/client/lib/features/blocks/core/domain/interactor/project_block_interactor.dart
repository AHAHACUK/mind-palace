import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';

class ProjectBlockInteractor {
  final ProjectBlockRepository _repository;

  const ProjectBlockInteractor({
    required ProjectBlockRepository repository,
  }) : _repository = repository;

  List<ProjectBlock> getBlocksForNode(ProjectNode node) {
    return _repository.getBlocksForNode(node);
  }
}
