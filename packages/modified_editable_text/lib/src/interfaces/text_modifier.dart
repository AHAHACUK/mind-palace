import 'package:modified_editable_text/src/entities/modified_text_update.dart';

abstract class TextModifier {
  ModifiedTextUpdate apply(ModifiedTextUpdate update);
}
