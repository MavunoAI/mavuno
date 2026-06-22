import 'diagnostic_status.dart';

final class DiagnosticResult {
  const DiagnosticResult({required this.name, required this.status, required this.message});

  final String name;
  final DiagnosticStatus status;
  final String message;
}
