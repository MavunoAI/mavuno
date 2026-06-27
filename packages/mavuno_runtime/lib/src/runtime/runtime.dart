import '../generation/generation_request.dart';
import '../generation/generation_result.dart';
import '../generation/generator.dart';

/// Public entry point into the Mavuno runtime.
///
/// Consumers (CLI, Flutter, desktop, benchmarks)
/// should only interact with this class.
final class Runtime {
  const Runtime({required Generator generator}) : _generator = generator;

  final Generator _generator;

  /// Generates tokens for a prompt using the configured runtime.
  GenerationResult generate(GenerationRequest request) {
    return _generator.generate(request);
  }
}
