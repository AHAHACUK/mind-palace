import 'package:flutter/widgets.dart';
import 'package:mind_palace_client/features/blocks/text/modifiers/bold_text_modifier.dart';
import 'package:mind_palace_client/features/blocks/text/modifiers/italic_text_modifier.dart';
import 'package:modified_editable_text/effects_editable_text.dart';

class TextBlock extends StatefulWidget {
  const TextBlock({super.key});

  @override
  State<TextBlock> createState() => _TextBlockState();
}

class _TextBlockState extends State<TextBlock> {
  final controller = ModifiedTextController(
    modifiers: [
      const BoldTextModifier(),
      const ItalicTextModifier(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ModifiedEditingText(
      controller: controller,
    );
  }
}
