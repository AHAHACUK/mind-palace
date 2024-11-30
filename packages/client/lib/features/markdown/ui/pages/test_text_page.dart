import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_intent_handler.dart';
import 'package:mind_palace_client/features/markdown/ui/entities/markdown_text_controller.dart';

class TestTextPage extends StatefulWidget {
  const TestTextPage({super.key});

  @override
  State<TestTextPage> createState() => _TestTextPageState();
}

class _TestTextPageState extends State<TestTextPage> {
  final controller = MarkdownTextController();
  late final MarkdownIntentHandler intentHandler;
  final f = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    intentHandler = MarkdownIntentHandler(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomEditableText(
        controller: controller,
        inputHandler: const KeyboardInputHandler(),
        intentHandler: intentHandler,
      ),
    );
  }
}
