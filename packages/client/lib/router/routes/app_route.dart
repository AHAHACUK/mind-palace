import 'package:flutter/material.dart';

abstract class AppRoute {
  const AppRoute();

  Widget build();

  String toUrlString();
}
