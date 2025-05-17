import 'dart:async';

import 'package:client/features/nodes/domain/entities/node.dart';
import 'package:client/features/nodes/ui/state/node_creator/node_creator_cubit.dart';
import 'package:client/features/nodes/ui/state/node_edit/node_edit_cubit.dart';
import 'package:client/toolkit/utils/adaptive_size.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'node_widget_view.dart';
part 'node_widget_edit.dart';

class NodeWidget extends StatefulWidget {
  final Node node;

  const NodeWidget({super.key, required this.node});

  @override
  State<NodeWidget> createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  late final NodeEditCubit editCubit;

  final Set<StreamSubscription> subs = {};

  @override
  void initState() {
    super.initState();
    editCubit = BlocProvider.of<NodeEditCubit>(context);
    subs.add(editCubit.stream.listen((s) => setState(() {})));
  }

  @override
  void dispose() {
    for (var e in subs) {
      e.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editState = editCubit.state;
    final isEditing = editState is EditingNodeEditState;
    final isLoading = editState is LoadingNodeEditState;
    final canStartEdit = !isEditing && !isLoading;
    return BlocProvider.value(
      value: editCubit,
      child: GestureDetector(
        onLongPress: () {
          if (!canStartEdit) return;
          editCubit.startEditing(widget.node);
        },
        child: Row(
          children: [
            Expanded(
              child: switch (editState) {
                EditingNodeEditState s =>
                  s.node.id == widget.node.id
                      ? _NodeWidgetEdit(node: widget.node)
                      : _NodeWidgetView(node: widget.node),
                LoadingNodeEditState _ => _NodeWidgetView(node: widget.node),
                IdleNodeEditState _ => _NodeWidgetView(node: widget.node),
              },
            ),
          ],
        ),
      ),
    );
  }
}
