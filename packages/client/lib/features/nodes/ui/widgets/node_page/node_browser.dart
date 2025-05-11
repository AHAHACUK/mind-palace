import 'dart:async';

import 'package:client/dependency/dependency.dart';
import 'package:client/features/nodes/ui/state/node_browser/node_browser_cubit.dart';
import 'package:client/features/nodes/ui/state/node_creator/node_creator_cubit.dart';
import 'package:client/features/nodes/ui/widgets/node_page/node_browser_list.dart';
import 'package:client/features/nodes/ui/widgets/node_page/node_widget/node_widget.dart';
import 'package:client/toolkit/utils/adaptive_size.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:client/toolkit/utils/toast_controller.dart';
import 'package:client/toolkit/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NodeBrowser extends StatefulWidget {
  const NodeBrowser({super.key});

  @override
  State<NodeBrowser> createState() => _NodeBrowserState();
}

class _NodeBrowserState extends State<NodeBrowser> with ToastMixin {
  late final NodeBrowserCubit browserCubit;
  late final NodeCreatorCubit creatorCubit;

  final Set<StreamSubscription> subs = {};

  @override
  void initState() {
    super.initState();
    browserCubit = Dependency.instance.blocFactory.nodeBrowser();
    creatorCubit = Dependency.instance.blocFactory.nodeCreator();

    subs.add(browserCubit.stream.listen((_) => setState(() {})));
    subs.add(creatorCubit.stream.listen((_) => setState(() {})));
    subs.add(creatorCubit.effectsStream.listen(_onCreatorEffect));

    browserCubit.fetchStructureAll();
  }

  void _onCreatorEffect(NodeCreatorEffect effect) {
    final locale = context.locale;
    if (effect is SuccessNodeCreatorState) {
      browserCubit.fetchStructureAll();
    } else if (effect is ErrorNodeCreatorState) {
      showErrorToast(message: locale.errorOccurred);
    }
  }

  @override
  void dispose() {
    browserCubit.close();
    creatorCubit.close();

    for (var sub in subs) {
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

    final browserState = browserCubit.state;

    if (browserState is PendingNodeBrowserState) {
      return Center(child: CircularProgressIndicator());
    }
    if (browserState is ErrorNodeBrowserState) {
      return Center(
        child: ErrorMessage(onRetry: browserCubit.fetchStructureAll),
      );
    }
    if (browserState is DataNodeBrowserState) {
      final nodes = browserState.rootNodes;

      return BlocProvider.value(
        value: creatorCubit,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 64).r,
                Expanded(
                  child: Text(
                    'Project N',
                    textAlign: TextAlign.center,
                    style: styles.titleMedium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    creatorCubit.createNode(name: locale.page, parentId: null);
                  },
                  child: Icon(Icons.add, size: 64.r, color: colors.onSurface),
                ),
              ],
            ),
            Expanded(child: NodeBrowserList(nodes: nodes)),
          ],
        ),
      );
    }
    throw UnimplementedError('Unexpected state: $browserState');
  }
}
