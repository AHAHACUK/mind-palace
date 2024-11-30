import 'package:custom_editable_text/custom_editable_text.dart';
import 'package:custom_editable_text/src/custom_text_controller_adapter.dart';
import 'package:flutter/material.dart';

class CustomEditableText<T extends CustomTextValue> extends StatefulWidget {
  final CustomTextController<T> controller;
  final TextStyle? textStyle;
  final CustomInputHandler inputHandler;
  final CustomIntentHandler intentHandler;

  const CustomEditableText({
    super.key,
    required this.controller,
    required this.inputHandler,
    required this.intentHandler,
    this.textStyle,
  });

  @override
  State<CustomEditableText> createState() => _CustomEditableTextState();
}

class _CustomEditableTextState<T extends CustomTextValue>
    extends State<CustomEditableText<T>> {
  late FocusNode keyBoardFocusNode;
  late FocusNode editingTextNode;
  late CustomTextController<T> controller;
  late CustomTextControllerAdapter controllerAdapter;

  @override
  void initState() {
    super.initState();
    keyBoardFocusNode = FocusNode();
    editingTextNode = FocusNode();

    _updateController(widget.controller);
  }

  void _updateController(CustomTextController<T> newController) {
    controller = newController;
    controllerAdapter = CustomTextControllerAdapter(newController);
  }

  @override
  void didUpdateWidget(covariant CustomEditableText<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _updateController(widget.controller);
    }
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, __, ___) => KeyboardListener(
        focusNode: keyBoardFocusNode,
        onKeyEvent: (keyEvent) {
          final intent = widget.inputHandler.handleKey(
            keyEvent: keyEvent,
            selection: controller.selection,
          );
          if (intent != null) {
            widget.intentHandler.handleIntent(intent);
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: EditableText(
            readOnly: true,
            controller: controllerAdapter,
            focusNode: editingTextNode,
            style: widget.textStyle ??
                Theme.of(context).textTheme.bodyLarge ??
                const TextStyle(),
            maxLines: null,
            cursorColor: Colors.black,
            backgroundCursorColor: Colors.black,
            showCursor: true,
            selectionColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
