import 'package:mind_palace_json_storage/utils/nullable.dart';

class ProjectNodeUpdateModel {
  final String? name;
  final int? order;
  final Nullable<int>? parentNodeId;

  const ProjectNodeUpdateModel({
    this.name,
    this.order,
    this.parentNodeId,
  });
}
