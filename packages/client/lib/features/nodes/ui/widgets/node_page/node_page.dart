import 'package:client/features/nodes/ui/widgets/node_page/node_browser.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/material.dart';

class NodePage extends StatefulWidget {
  final String nodePath;
  const NodePage({super.key, required this.nodePath});

  @override
  State<NodePage> createState() => _NodePageState();
}

class _NodePageState extends State<NodePage> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        backgroundColor: colors.surfaceContainer,
      ),
      drawer: FractionallySizedBox(
        widthFactor: 3 / 4,
        child: Container(
          decoration: BoxDecoration(color: colors.surface),
          child: SafeArea(
            child: NodeBrowser(),
          ),
        ),
      ),
      body: Column(children: []),
    );
  }
}
