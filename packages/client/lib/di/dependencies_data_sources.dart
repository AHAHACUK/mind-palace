part of 'dependencies.dart';

Future<_DependenciesDataSources> _initDataSources() async {
  final jsonStorage = MindPalaceJsonStorage(
    path: 'test.plc',
  );
  

  return _DependenciesDataSources(
    mindPalaceJsonStorage: jsonStorage,
  );
}

class _DependenciesDataSources {
  final MindPalaceJsonStorage mindPalaceJsonStorage;

  _DependenciesDataSources({
    required this.mindPalaceJsonStorage,
  });
}
