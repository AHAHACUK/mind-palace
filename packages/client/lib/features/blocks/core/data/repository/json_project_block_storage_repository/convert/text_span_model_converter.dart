import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/convert/text_effect_model_converter.dart';
import 'package:mind_palace_json_storage/core/models/blocks/text/modified_text_span_model.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

extension ModifiedTextSpanModelConverter on ModifiedTextSpan {
  ModifiedTextSpanModel toModel() {
    return ModifiedTextSpanModel(
      text: text,
      effects: effects.map((e) => e.toModel()).toSet(),
    );
  }
}
