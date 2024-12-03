import 'package:mind_palace_client/features/blocks/core/domain/entities/project_block.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class TextProjectBlock extends ProjectBlock {
  final List<ModifiedTextSpan> spans;

  const TextProjectBlock({
    required super.id,
    required super.order,
    required super.parentNodeId,
    required this.spans,
  });
}
