import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/markdown/ui/widgets/markdown_editing_text.dart';

class TestTextPage extends StatelessWidget {
  const TestTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MarkdownEditingText(),
    );
  }
}
