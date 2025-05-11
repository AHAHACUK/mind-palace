part of 'node_widget.dart';

class _NodeWidgetEdit extends StatefulWidget {
  final Node node;

  const _NodeWidgetEdit({required this.node});

  @override
  State<_NodeWidgetEdit> createState() => _NodeWidgetEditState();
}

class _NodeWidgetEditState extends State<_NodeWidgetEdit> {
  late final TextEditingController controller;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.node.name);
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  void _finish() {
    final editCubit = BlocProvider.of<NodeEditCubit>(context);
    editCubit.finishEditing(name: controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final styles = theme.textTheme;
    final colors = theme.colorScheme;
    return TapRegion(
      onTapOutside: (_) => _finish(),
      child: EditableText(
        autofocus: true,
        controller: controller,
        focusNode: focusNode,
        style: styles.bodyMedium!.copyWith(color: colors.onSurfaceVariant),
        cursorColor: colors.primary,
        selectionColor: colors.primary.withAlpha(150),
        backgroundCursorColor: colors.primary.withAlpha(150),
        onSubmitted: (_) => _finish(),
      ),
    );
  }
}