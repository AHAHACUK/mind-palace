import 'dart:developer';

import 'package:mind_palace/features/reporter/domain/repositories/reporter_repository.dart';

class LocalReporterRepository implements ReporterRepository {
  @override
  Future<void> reportError(Object error, StackTrace trace) async {
    log(error.toString(), stackTrace: trace);
  }
}
