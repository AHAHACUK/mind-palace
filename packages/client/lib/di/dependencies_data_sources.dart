part of 'dependencies.dart';

Future<_DependenciesDataSources> _initDataSources() async {
  final mindPalaceJsonStorage = MindPalaceCachedJsonStorage(
    path: 'test.plc',
  );
  await mindPalaceJsonStorage.init();

  return _DependenciesDataSources(
    mindPalaceJsonStorage: mindPalaceJsonStorage,
  );
}

class _DependenciesDataSources {
  final MindPalaceCachedJsonStorage mindPalaceJsonStorage;

  _DependenciesDataSources({
    required this.mindPalaceJsonStorage,
  });
}
