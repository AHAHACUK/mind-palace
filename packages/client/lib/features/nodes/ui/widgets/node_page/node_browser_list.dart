import 'package:client/features/nodes/ui/state/node_browser/node_browser_cubit.dart';
import 'package:client/features/nodes/ui/widgets/node_page/node_widget/node_widget.dart';
import 'package:client/toolkit/utils/adaptive_size.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:client/toolkit/utils/list_utils.dart';
import 'package:flutter/material.dart';

class NodeBrowserList extends StatelessWidget {
  final List<NodeTreeState> nodes;
  const NodeBrowserList({super.key, required this.nodes});

  List<_NodeTreeStateIndented> _indentNode(int indent, NodeTreeState node) {
    final children = node.children.map((e) => _indentNode(indent + 1, e));
    return [
      _NodeTreeStateIndented(indent: indent, node: node),
      ...children.flatten(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final nodesIndented =
        nodes.map((e) => _indentNode(0, e)).flatten().toList();
    return ListView.builder(
      itemCount: nodesIndented.length,
      itemBuilder: (_, index) {
        final indent = nodesIndented[index].indent;
        final node = nodesIndented[index].node;
        final Widget expandWidget;
        if (node.children.isEmpty) {
          expandWidget = SizedBox(width: 24).r;
        } else if (node.isOpened) {
          expandWidget = Icon(
            size: 24.r,
            Icons.expand_more,
            color: colors.onSurface,
          );
        } else {
          expandWidget = Icon(
            size: 24.r,
            Icons.chevron_right,
            color: colors.onSurface,
          );
        }
        return Row(
          children: [
            SizedBox(width: 32.0 * indent).r,
            expandWidget,
            const SizedBox(width: 8).r,
            Expanded(child: NodeWidget(node: node.node)),
          ],
        );
      },
    );
  }
}

class _NodeTreeStateIndented {
  final int indent;
  final NodeTreeState node;

  _NodeTreeStateIndented({required this.indent, required this.node});
}
