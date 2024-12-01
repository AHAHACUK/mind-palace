import 'package:flutter/material.dart';

class EditionTextCompact extends StatefulWidget {
  const EditionTextCompact({super.key});

  @override
  State<EditionTextCompact> createState() => _EditionTextCompactState();
}

class _EditionTextCompactState extends State<EditionTextCompact> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: controller,
      focusNode: focusNode,
      maxLines: null,
      style: const TextStyle(color: Colors.red),
      cursorColor: Colors.red,
      backgroundCursorColor: Colors.red,
    );
  }
}
