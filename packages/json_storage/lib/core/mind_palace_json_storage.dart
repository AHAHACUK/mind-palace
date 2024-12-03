import 'dart:io';
import 'dart:convert';

import 'package:mind_palace_json_storage/core/models/project_model.dart';

class MindPalaceJsonStorage {
  final String _path;

  MindPalaceJsonStorage({
    required String path,
  }) : _path = path;

  Future<ProjectModel> read() async {
    final file = File(_path);
    final fileExits = await file.exists();
    if (!fileExits) {
      return ProjectModel.initial();
    } else {
      final content = await file.readAsString();
      final json = jsonDecode(content);
      return ProjectModel.fromJson(json);
    }
  }

  Future<void> save(ProjectModel project) async {
    final file = File(_path);
    final json = project.toJson();
    final content = jsonEncode(json);
    await file.writeAsString(content);
  }
}
