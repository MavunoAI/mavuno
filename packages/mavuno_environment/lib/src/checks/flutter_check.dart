import 'package:mavuno_foundation/mavuno_foundation.dart';

import '../services/process_runner.dart';
import 'environment_check.dart';

final class GitCheck implements EnvironmentCheck {
  GitCheck(this._runner);

  final ProcessRunner _runner;

  @override
  String get name => 'Git';

  @override
  Future<DiagnosticResult> execute() async {
    try {
      final result = await _runner.run('flutter', ['--version']);

      if (result.exitCode == 0) {
        return DiagnosticResult(
          name: name,
          status: DiagnosticStatus.passed,
          message: '${result.stdout}'.trim(),
        );
      }

      return DiagnosticResult(
        name: name,
        status: DiagnosticStatus.failed,
        message: 'Git is not installed.',
      );
    } catch (_) {
      return DiagnosticResult(
        name: name,
        status: DiagnosticStatus.failed,
        message: 'Git executable not found.',
      );
    }
  }
}
