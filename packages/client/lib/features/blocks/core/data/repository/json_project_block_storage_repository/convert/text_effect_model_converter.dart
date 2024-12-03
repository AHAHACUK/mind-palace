import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/effects/bold_text_effect.dart';
import 'package:mind_palace_client/features/blocks/blocks/text/effects/markdown/effects/italic_text_effect.dart';
import 'package:mind_palace_json_storage/core/models/blocks/text/text_effect_model.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

extension TextEffectModelConverter on TextEffect {
  TextEffectModel toModel() {
    return switch (this) {
      BoldTextEffect _ => const BoldTextEffectModel(),
      ItalicTextEffect _ => const ItalicTextEffectModel(),
      _ => throw ArgumentError('Could not convert $this'),
    };
  }
}
