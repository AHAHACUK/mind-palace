import 'package:mind_palace/features/reporter/domain/repositories/reporter_repository.dart';

class MultiReporterRepository implements ReporterRepository {
  final List<ReporterRepository> repositories;

  MultiReporterRepository({required this.repositories});

  @override
  Future<void> reportError(Object error, StackTrace trace) async {
    final futures = repositories.map((e) => e.reportError(error, trace));
    await Future.wait(futures);
  }
}
