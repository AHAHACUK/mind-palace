import 'package:mind_palace_client/features/blocks/blocks/text/text_project_block.dart';
import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/convert/text_span_model_converter.dart';
import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:mind_palace_json_storage/core/models/project_block_model.dart';

extension ProjectBlockModelConverter on ProjectBlock {
  ProjectBlockModel toModel() {
    return switch (this) {
      TextProjectBlock entity => TextProjectBlockModel(
          id: id,
          order: order,
          parentNodeId: parentNodeId,
          textSpans: entity.spans.map((e) => e.toModel()).toList(),
        ),
      _ => throw ArgumentError('Could not convert $this'),
    };
  }
}
