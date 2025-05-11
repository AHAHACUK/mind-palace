import 'dart:async';

import 'package:client/dependency/dependency.dart';
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
    editCubit = Dependency.instance.blocFactory.nodeEdit(node: widget.node);
    subs.add(editCubit.stream.listen((s) => setState(() {})));
  }

  @override
  void dispose() {
    editCubit.close();
    for (var e in subs) {
      e.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editState = editCubit.state;
    final node = editState.node;
    final isEditing = editState is ProcessNameNodeEditState;
    final isLoading = editState is LoadingNodeEditState;
    final canStartEdit = !isEditing && !isLoading;
    return BlocProvider.value(
      value: editCubit,
      child: GestureDetector(
        onLongPress: () {
          if (!canStartEdit) return;
          editCubit.startEditing();
        },
        child: Row(
          children: [
            Expanded(
              child: switch (editState) {
                ProcessNameNodeEditState _ => _NodeWidgetEdit(node: node),
                LoadingNodeEditState _ => _NodeWidgetView(node: node),
                IdleNodeEditState _ => _NodeWidgetView(node: node),
              },
            ),
          ],
        ),
      ),
    );
  }
}
