import 'package:client/dependency/dependency.dart';
import 'package:client/features/nodes/ui/state/node_creator/node_creator_cubit.dart';
import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNodeWidget extends StatefulWidget {
  final NodeCreatorCubit? creatorCubit;

  const CreateNodeWidget({super.key, this.creatorCubit});

  @override
  State<CreateNodeWidget> createState() => _CreateNodeWidgetState();
}

class _CreateNodeWidgetState extends State<CreateNodeWidget> {
  late final NodeCreatorCubit creatorCubit;

  @override
  void initState() {
    super.initState();
    creatorCubit =
        widget.creatorCubit ?? Dependency.instance.blocFactory.nodeCreator();
  }

  @override
  void dispose() {
    if (widget.creatorCubit == null) {
      creatorCubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    return BlocBuilder(
      bloc: creatorCubit,
      builder: (context, state) {
        if (state is LoadingNodeCreatorState) {
          return TextButton(
            onPressed: () {},
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is IdleNodeCreatorState) {
          return TextButton(
            onPressed: () {
              creatorCubit.createNode(name: locale.page, parentId: null);
            },
            child: Text(locale.createPage),
          );
        }
        throw UnimplementedError('Unexpected state: $state');
      },
    );
  }
}
