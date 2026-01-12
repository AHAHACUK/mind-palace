import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/features/explorer/ui/pages/explorer_page.dart';
import 'package:mind_palace/router/routes/app_route.dart';
import 'package:mind_palace/router/utils/path_builder.dart';

class ExplorerRoute extends AppRoute {
  final String folderPath;
  static String path = '/explore/:folderPath';

  const ExplorerRoute(this.folderPath);

  static GoRoute toGoRoute() {
    return GoRoute(path: path);
  }

  @override
  Widget build() {
    return ExplorerPage();
  }

  @override
  String toUrlString() {
    return PathBuilder.build(path, pathParameters: {"folderPath": folderPath});
  }
}
