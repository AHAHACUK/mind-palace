import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/convert/project_block_model_converter.dart';
import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/parse/project_block_model_parser.dart';
import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_client/features/blocks/core/domain/repository/project_block_storage_repository.dart';
import 'package:mind_palace_json_storage/core/mind_palace_json_storage.dart';

class JsonProjectBlockStorageRepository
    implements ProjectBlockStorageRepository {
  final MindPalaceJsonStorage _storage;

  JsonProjectBlockStorageRepository({
    required MindPalaceJsonStorage storage,
  }) : _storage = storage;

  @override
  Future<List<ProjectBlock>> getBlocks() async {
    final projectModel = await _storage.read();
    return projectModel.blocks.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> save(List<ProjectBlock> projectBlocks) async {
    final models = projectBlocks.map((e) => e.toModel()).toList();
    final project = await _storage.read();
    await _storage.save(project.copyWith(blocks: models));
  }
}
