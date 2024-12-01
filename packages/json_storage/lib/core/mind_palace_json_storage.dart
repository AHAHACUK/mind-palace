import 'dart:convert';
import 'dart:io';

import 'package:mind_palace_json_storage/core/models/project_model.dart';
import 'package:mind_palace_json_storage/mind_palace_storage.dart';

class MindPalaceCachedJsonStorage {
  final String _path;
  late ProjectModel _project;

  late final ProjectNodesStorage nodes;
  late final ProjectBlocksStorage blocks;

  MindPalaceCachedJsonStorage({
    required String path,
  }) : _path = path;

  Future<void> init() async {
    final file = File(_path);
    final fileExits = await file.exists();
    if (!fileExits) {
      _project = ProjectModel.initial();
    } else {
      final content = await file.readAsString();
      final json = jsonDecode(content);
      _project = ProjectModel.fromJson(json);
    }

    nodes = ProjectNodesStorage(project: _project);
  }

  ProjectModel read() {
    return _project;
  }

  Future<void> save(ProjectModel project) async {
    project = project;
    final file = File(_path);
    final json = project.toJson();
    final content = jsonEncode(json);
    await file.writeAsString(content);
  }
}
