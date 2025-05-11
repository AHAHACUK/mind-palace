part of 'node_widget.dart';

class _NodeWidgetView extends StatefulWidget {
  final Node node;

  const _NodeWidgetView({required this.node});

  @override
  State<_NodeWidgetView> createState() => _NodeWidgetViewState();
}

class _NodeWidgetViewState extends State<_NodeWidgetView> {
  late final Set<StreamSubscription> subs = {};
  late final NodeCreatorCubit creatorCubit;
  late final NodeEditCubit editCubit;

  @override
  void initState() {
    super.initState();
    editCubit = BlocProvider.of<NodeEditCubit>(context);
    creatorCubit = BlocProvider.of<NodeCreatorCubit>(context);

    editCubit.stream.listen((_) => setState(() {}));
    creatorCubit.stream.listen((_) => setState(() {}));
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
    final editState = editCubit.state;
    final creatorState = creatorCubit.state;
    final isCreatingSomething = creatorState is LoadingNodeCreatorState;
    final color = switch (editState) {
      ProcessNameNodeEditState _ => colors.onSurface,
      LoadingNodeEditState _ => theme.disabledColor,
      IdleNodeEditState _ => colors.onSurface,
    };
    return Row(
      children: [
        Text(
          widget.node.name,
          style: styles.bodyMedium!.copyWith(color: color),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (isCreatingSomething) return;
            creatorCubit.createNode(
              name: locale.page,
              parentId: widget.node.id,
            );
          },
          child: Icon(Icons.add, size: 64.r, color: color),
        ),
      ],
    );
  }
}
