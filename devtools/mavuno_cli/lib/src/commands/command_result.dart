class CommandResult {
  const CommandResult({required this.exitCode, required this.message});

  final int exitCode;
  final String message;

  bool get isSuccess => exitCode == 0;
}
