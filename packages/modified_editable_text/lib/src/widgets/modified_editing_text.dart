import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:flutter/widgets.dart';
import 'package:modified_editable_text/src/controllers/modified_text_controller.dart';
import 'package:modified_editable_text/src/controllers/modified_controller_intent_handler.dart';

class ModifiedEditingText extends StatefulWidget {
  final ModifiedTextController controller;

  const ModifiedEditingText({
    super.key,
    required this.controller,
  });

  @override
  State<ModifiedEditingText> createState() => _ModifiedEditingTextState();
}

class _ModifiedEditingTextState extends State<ModifiedEditingText> {
  late final CustomIntentHandler intentHandler;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    intentHandler = ModifiedControllerIntentHandler(
      controller: widget.controller,
    );
  }

  @override
  void didUpdateWidget(covariant ModifiedEditingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      intentHandler = ModifiedControllerIntentHandler(
        controller: widget.controller,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomEditableText(
      controller: widget.controller,
      inputHandler: const KeyboardInputHandler(),
      intentHandler: intentHandler,
    );
  }
}
