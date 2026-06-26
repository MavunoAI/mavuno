import 'generation_request.dart';
import 'generation_result.dart';

/// High-level text generation contract.
abstract interface class Generator {
  GenerationResult generate(GenerationRequest request);
}
