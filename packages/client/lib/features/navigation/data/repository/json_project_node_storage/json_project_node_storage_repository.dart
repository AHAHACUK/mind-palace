import 'package:mind_palace_client/features/navigation/data/repository/json_project_node_storage/project_node_model_parser.dart';
import 'package:mind_palace_client/features/navigation/domain/entities/project_node.dart';
import 'package:mind_palace_client/features/navigation/domain/repository/project_node_storage_repository.dart';
import 'package:mind_palace_json_storage/mind_palace_storage.dart';

class JsonProjectNodeStorageRepository implements ProjectNodeStorageRepository {
  final MindPalaceJsonStorage _storage;

  JsonProjectNodeStorageRepository({
    required MindPalaceJsonStorage storage,
  }) : _storage = storage;

  @override
  Future<List<ProjectNode>> getAllNodes() async {
    final projectModel = await _storage.read();
    return projectModel.nodes.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> save(List<ProjectNode> projectNodes) async {
    final models = projectNodes.map((e) => e.toModel()).toList();
    final project = await _storage.read();
    await _storage.save(project.copyWith(nodes: models));
  }
}
