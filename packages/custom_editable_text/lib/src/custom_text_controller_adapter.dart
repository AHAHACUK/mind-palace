import 'package:custom_editable_text/src/custom_text_controller.dart';
import 'package:flutter/material.dart';

class CustomTextControllerAdapter extends ChangeNotifier
    implements TextEditingController {
  final CustomTextController _controller;

  @override
  TextSelection get selection => _controller.selection;

  Never _error() {
    throw Exception(
      'Unexpected interaction with [CustomTextControllerAdapter]',
    );
  }

  @override
  set selection(TextSelection selection) {
    _controller.selection = selection;
  }

  @override
  String get text => _error();

  @override
  set text(String _) => _error();

  @override
  TextEditingValue get value => TextEditingValue(
        selection: selection,
        text: String.fromCharCodes(
          List.filled(_controller.textLength, 0),
        ),
      );

  @override
  set value(TextEditingValue value) {
    final newSelection = value.selection;
    selection = newSelection;
  }

  CustomTextControllerAdapter(this._controller);

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) =>
      _controller.buildTextSpan(
        context: context,
        style: style,
      );

  @override
  void clear() {}

  @override
  void clearComposing() {}
}
