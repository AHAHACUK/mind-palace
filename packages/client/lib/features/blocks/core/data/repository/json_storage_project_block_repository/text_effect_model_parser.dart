import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/effects/bold_text_effect.dart';
import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/effects/italic_text_effect.dart';
import 'package:mind_palace_json_storage/storages/blocks/models/blocks/text/text_effect_model.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

extension TextEffectModelParser on TextEffectModel {
  TextEffect toEntity() {
    return switch (this) {
      BoldTextEffectModel _ => const BoldTextEffect(),
      ItalicTextEffectModel _ => const ItalicTextEffect(),
    };
  }
}
