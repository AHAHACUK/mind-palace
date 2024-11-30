import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_intent_handler.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_controller.dart';

class MarkdownEditingText extends StatefulWidget {
  const MarkdownEditingText({super.key});

  @override
  State<MarkdownEditingText> createState() => _MarkdownEditingTextState();
}

class _MarkdownEditingTextState extends State<MarkdownEditingText> {
  final controller = MarkdownTextController();
  late final MarkdownIntentHandler intentHandler;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    intentHandler = MarkdownIntentHandler(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return CustomEditableText(
      controller: controller,
      inputHandler: const KeyboardInputHandler(),
      intentHandler: intentHandler,
    );
  }
}
