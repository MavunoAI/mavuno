import 'dart:io';

final class ProcessRunner {
  const ProcessRunner();

  Future<ProcessResult> run(
    String executable,
    List<String> arguments,
  ) {
    return Process.run(executable, arguments);
  }
}
