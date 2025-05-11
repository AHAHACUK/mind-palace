import 'dart:async';

import 'package:client/dependency/dependency.dart';
import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/ui/state/node_edit/node_edit_cubit.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/material.dart';

class NodeWidget extends StatefulWidget {
  final Node node;
  final bool isOpened;

  const NodeWidget({super.key, required this.node, required this.isOpened});

  @override
  State<NodeWidget> createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  late final NodeEditCubit editCubit;
  late final TextEditingController controller;
  final FocusNode focusNode = FocusNode();

  final Set<StreamSubscription> subs = {};

  @override
  void initState() {
    super.initState();
    editCubit = Dependency.instance.blocFactory.nodeEdit(node: widget.node);
    controller = TextEditingController(text: widget.node.name);
    subs.add(
      editCubit.stream.listen((s) {
        setState(() {});
      }),
    );
  }

  @override
  void dispose() {
    editCubit.close();
    for (var e in subs) {
      e.cancel();
    }
    super.dispose();
  }

  void _finishEditing() {
    editCubit.finishEditingName(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final styles = theme.textTheme;
    final textStyle = styles.bodySmall!;
    final editState = editCubit.state;
    final node = editState.node;
    final isEditing = editState is ProcessNameNodeEditState;
    final isLoading = editState is LoadingNodeEditState;
    final canStartEdit = !isEditing && !isLoading;
    return TapRegion(
      onTapOutside: (_) {
        if (!isEditing) return;
        _finishEditing();
      },
      child: GestureDetector(
        onLongPress: () {
          if (!canStartEdit) return;
          editCubit.startEditing();
          focusNode.requestFocus();
        },
        child: Row(
          children: [
            Expanded(
              child: switch (editState) {
                ProcessNameNodeEditState _ => EditableText(
                  controller: controller,
                  focusNode: focusNode,
                  style: textStyle.copyWith(color: colors.onSurfaceVariant),
                  cursorColor: colors.primary,
                  selectionColor: colors.primary.withAlpha(150),
                  backgroundCursorColor: colors.primary.withAlpha(150),
                  onSubmitted: (_) => _finishEditing(),
                ),
                LoadingNodeEditState _ => Text(
                  node.name,
                  style: textStyle.copyWith(color: theme.disabledColor),
                ),
                IdleNodeEditState _ => Text(node.name, style: textStyle),
              },
            ),
          ],
        ),
      ),
    );
  }
}
