import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/router/routes/app_route.dart';
import 'package:mind_palace/router/utils/path_builder.dart';

class ViewRoute extends AppRoute {
  static String path = '/view/:path';

  const ViewRoute();

  static GoRoute toGoRoute() {
    return GoRoute(path: path);
  }

  @override
  Widget build() {
    throw UnimplementedError();
  }

  @override
  String toUrlString() {
    return PathBuilder.build(path);
  }
}
