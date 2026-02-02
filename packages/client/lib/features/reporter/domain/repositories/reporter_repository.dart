abstract class ReporterRepository {
  Future<void> reportError(Object error, StackTrace trace);
}
