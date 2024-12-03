import 'package:mind_palace_client/features/blocks/core/data/repository/json_project_block_storage_repository/parse/text_effect_model_parser.dart';
import 'package:mind_palace_json_storage/core/models/blocks/text/modified_text_span_model.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

extension ModifiedTextSpanModelParser on ModifiedTextSpanModel {
  ModifiedTextSpan toEntity() {
    return ModifiedTextSpan(
      text: text,
      effects: effects.map((e) => e.toEntity()).toSet(),
    );
  }
}
