import 'package:uri/uri.dart';

abstract class PathBuilder {
  static String build(
    String path, {
    Map<String, String>? pathParameters,
    Map<String, String>? queryParameters,
  }) {
    final builder = UriBuilder();
    if (pathParameters != null) {
      for (final pathParameters in pathParameters.entries) {
        final key = pathParameters.key;
        final value = pathParameters.value;
        path = path.replaceFirst(':$key', value);
      }
    }
    builder.path = path;
    if (queryParameters != null) {
      builder.queryParameters = queryParameters;
    }
    return builder.toString();
  }
}
