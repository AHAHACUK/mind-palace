import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_palace_client/di/dependencies.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_root_cubit/project_root_cubit.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_root_cubit/project_root_state.dart';
import 'package:mind_palace_client/features/navigation/ui/widgets/navigation_node_widget.dart';
import 'package:mind_palace_client/features/navigation/ui/widgets/project_node_widget.dart';
import 'package:mind_palace_client/utils/context_ext/locales_ext.dart';

class NavigationPanel extends StatefulWidget {
  const NavigationPanel({super.key});

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  late final ProjectRootCubit rootCubit;

  @override
  void initState() {
    super.initState();
    rootCubit = Dependencies.blocFactories.projectRoot();
    rootCubit.update();
  }

  @override
  void dispose() {
    rootCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final theme = Theme.of(context);
    return BlocBuilder(
      bloc: rootCubit,
      builder: (context, state) {
        if (state is LoadingProjectRootState) {
          return const Center(child: CircularProgressIndicator());
        }
        final viewingState = state as ViewingProjectRootState;
        final childrenIds = viewingState.rootChildrenIds;
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavigationNodeWidget(
                  label: locale.defaultProjectName,
                  isOpened: true,
                  level: 0,
                ),
                for (final id in childrenIds)
                  ProjectNodeWidget(
                    nodeId: id,
                    level: 1,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
