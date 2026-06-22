import '../checks/environment_check.dart';

typedef DiagnosticResult = Object;

final class DoctorService {
  DoctorService(this._checks);

  final List<EnvironmentCheck> _checks;

  Future<List<DiagnosticResult>> run() async {
    final results = <DiagnosticResult>[];

    for (final check in _checks) {
      results.add(await check.execute());
    }

    return results;
  }
}
