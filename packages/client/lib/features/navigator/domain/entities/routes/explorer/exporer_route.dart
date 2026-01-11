import 'package:flutter/material.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_route.dart';
import 'package:mind_palace/features/navigator/domain/entities/app_route_configuration.dart';
import 'package:mind_palace/features/navigator/domain/utils/path_builder.dart';

class ExplorerRoute extends AppRoute {
  final String folderPath;
  static String path = '/explore/:folderPath';

  const ExplorerRoute(this.folderPath);

  static AppRouteConfiguration getConfig() {
    return AppRouteConfiguration(path: path);
  }

  @override
  Widget build() {
    throw UnimplementedError();
  }

  @override
  String toUrlString() {
    return PathBuilder.build(path, pathParameters: {"folderPath": folderPath});
  }
}
