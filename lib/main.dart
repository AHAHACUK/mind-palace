import 'package:flutter/material.dart';
import 'package:mind_palace/app_root.dart';
import 'package:mind_palace/di/dependencies.dart';

void main() async {
  await Dependencies.init();
  runApp(const AppRoot());
}
