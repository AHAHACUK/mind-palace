import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_palace_client/di/dependencies.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_node_cubit/project_node_cubit.dart';
import 'package:mind_palace_client/features/navigation/ui/state/project_node_cubit/project_node_state.dart';
import 'package:mind_palace_client/features/navigation/ui/widgets/navigation_node_widget.dart';

class ProjectNodeWidget extends StatefulWidget {
  final int nodeId;
  final int level;

  const ProjectNodeWidget({
    super.key,
    required this.nodeId,
    required this.level,
  });

  @override
  State<ProjectNodeWidget> createState() => _ProjectNodeWidgetState();
}

class _ProjectNodeWidgetState extends State<ProjectNodeWidget> {
  late final ProjectNodeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = Dependencies.blocFactories.projectNode(
      widget.nodeId,
    );
    cubit.update();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is LoadingProjectNodeState) {
          return const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(),
          );
        }
        final viewingState = state as ViewingProjectNodeState;
        final node = viewingState.node;
        final childrenIds = viewingState.nodeChildrenIds;
        return Column(
          children: [
            NavigationNodeWidget(
              label: node.name,
              level: widget.level,
              isOpened: node.isOpened,
            ),
            for (final childId in childrenIds)
              ProjectNodeWidget(
                nodeId: childId,
                level: widget.level + 1,
              ),
          ],
        );
      },
    );
  }
}
