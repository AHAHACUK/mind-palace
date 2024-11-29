import 'package:flutter/material.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_controller.dart';

class TestTextPage extends StatefulWidget {
  const TestTextPage({super.key});

  @override
  State<TestTextPage> createState() => _TestTextPageState();
}

class _TestTextPageState extends State<TestTextPage> {
  final controller = MarkdownTextController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditableText(
        controller: controller,
        focusNode: focusNode,
        maxLines: null,
        style: TextStyle(color: Colors.black),
        selectionColor: Colors.red,
        cursorColor: Colors.black,
        backgroundCursorColor: Colors.transparent,
      ),
    );
  }
}
