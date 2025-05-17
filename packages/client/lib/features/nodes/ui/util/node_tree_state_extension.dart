import 'package:client/features/nodes/ui/state/node_browser/node_browser_cubit.dart';

extension NodeTreeStateExtension on List<NodeTreeState> {
  bool everyNode(bool Function(NodeTreeState node) delegate) {
    return every((e) {
      final children = e.children.everyNode((e) => delegate(e));
      return children && delegate(e);
    });
  }
}
