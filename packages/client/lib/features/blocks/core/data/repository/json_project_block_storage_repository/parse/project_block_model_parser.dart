import 'package:mind_palace_client/features/blocks/blocks/text/text_project_block.dart';
import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/parse/text_span_model_parser.dart';
import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_json_storage/core/models/project_block_model.dart';

extension ProjectBlockModelParser on ProjectBlockModel {
  ProjectBlock toEntity() {
    return switch (this) {
      TextProjectBlockModel model => TextProjectBlock(
          id: id,
          order: order,
          parentNodeId: parentNodeId,
          spans: model.textSpans.map((e) => e.toEntity()).toList(),
        ),
    };
  }
}
