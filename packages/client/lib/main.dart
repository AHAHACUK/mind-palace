import 'package:flutter/material.dart';
import 'package:mind_palace_client/app_root.dart';
import 'package:mind_palace_client/di/dependencies.dart';

void main() async {
  await Dependencies.init();
  runApp(const AppRoot());
}
