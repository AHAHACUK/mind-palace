import 'dart:async';

import 'package:client/features/nodes/ui/state/node_browser/node_browser_cubit.dart';
import 'package:client/features/nodes/ui/state/node_creator/node_creator_cubit.dart';
import 'package:client/features/nodes/ui/util/node_tree_state_extension.dart';
import 'package:client/toolkit/utils/adaptive_size.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NodeBrowserHeader extends StatefulWidget {
  const NodeBrowserHeader({super.key});

  @override
  State<NodeBrowserHeader> createState() => _NodeBrowserHeaderState();
}

class _NodeBrowserHeaderState extends State<NodeBrowserHeader> {
  late final NodeCreatorCubit creatorCubit;
  late final NodeBrowserCubit browserCubit;

  final Set<StreamSubscription> subs = {};

  @override
  void initState() {
    creatorCubit = BlocProvider.of<NodeCreatorCubit>(context);
    browserCubit = BlocProvider.of<NodeBrowserCubit>(context);

    subs.add(creatorCubit.stream.listen((_) => setState(() {})));
    subs.add(browserCubit.stream.listen((_) => setState(() {})));

    super.initState();
  }

  @override
  void dispose() {
    for (final sub in subs) {
      sub.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final theme = context.theme;
    final colors = theme.colorScheme;
    final styles = theme.textTheme;
    final creatorState = creatorCubit.state;
    final browserState = browserCubit.state;
    final isTappable =
        creatorState is! LoadingNodeCreatorState &&
        browserState is! LoadingNodeBrowserState;
    final isNodeCollapsed =
        browserState is DataNodeBrowserState &&
        browserState.rootNodes.everyNode((node) => !node.isOpened);
    return Row(
      children: [
        SizedBox(
          width: 128.r,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (!isTappable) return;
                  browserCubit.setIsOpenedForAll(isNodeCollapsed);
                },
                child: Icon(
                  !isNodeCollapsed ? Icons.unfold_less : Icons.unfold_more,
                  size: 64.r,
                  color: isTappable ? colors.onSurface : theme.disabledColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            'Project N',
            textAlign: TextAlign.center,
            style: styles.titleMedium,
          ),
        ),
        SizedBox(
          width: 128.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (!isTappable) return;
                  creatorCubit.createNode(name: locale.page, parentId: null);
                },
                child: Icon(
                  Icons.add,
                  size: 64.r,
                  color: isTappable ? colors.onSurface : theme.disabledColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
