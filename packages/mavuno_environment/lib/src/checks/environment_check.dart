import 'package:mavuno_foundation/mavuno_foundation.dart';

abstract interface class EnvironmentCheck {
  String get name;

  Future<DiagnosticResult> execute();
}
