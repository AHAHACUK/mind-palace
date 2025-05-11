import 'package:client/features/nodes/ui/widgets/node_page/node_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/node/',
  routes: [
    GoRoute(
      path: '/:node',
      builder: (_, state) {
        final nodePath = state.pathParameters['node']!;
        return NodePage(nodePath: nodePath);
      },
    ),
  ],
);
