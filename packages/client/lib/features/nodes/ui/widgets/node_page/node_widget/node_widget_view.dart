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

    subs.add(editCubit.stream.listen((_) => setState(() {})));
    subs.add(creatorCubit.stream.listen((_) => setState(() {})));
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
    final editingSomething = editState is EditingNodeEditState;
    final blocked =
        creatorState is LoadingNodeCreatorState ||
        editState is LoadingNodeEditState;
    final color = blocked ? theme.disabledColor : colors.onSurface;
    return Row(
      children: [
        Text(
          widget.node.name,
          style: styles.bodyMedium!.copyWith(color: color),
        ),
        const Spacer(),
        if (!editingSomething)
          GestureDetector(
            onTap: () {
              if (blocked) return;
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
