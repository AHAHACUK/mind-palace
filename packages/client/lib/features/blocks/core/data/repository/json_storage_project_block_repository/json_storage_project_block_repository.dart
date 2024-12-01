import 'package:mind_palace_client/features/blocks/core/data/repository/json_storage_project_block_repository/project_block_model_parser.dart';
import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_repository.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_json_storage/mind_palace_storage.dart';

class JsonStorageProjectBlockRepository implements ProjectBlockRepository {
  final ProjectBlocksStorage _storage;

  JsonStorageProjectBlockRepository({
    required MindPalaceCachedJsonStorage storage,
  }) : _storage = storage.blocks;

  @override
  List<ProjectBlock> getBlocksForNode(ProjectNode node) {
    final models = _storage.getBlocksForNode(node.id);
    return models.map((e) => e.toEntity()).toList();
  }
}
