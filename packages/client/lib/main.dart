import 'package:client/dependency/default_init/dependency_init.dart';
import 'package:client/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInit();
  runApp(const RootPage());
}
