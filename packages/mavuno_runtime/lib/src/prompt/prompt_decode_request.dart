import '../generation/generation_state.dart';

/// Request to prefill the model with a prompt.
final class PromptDecodeRequest {
  const PromptDecodeRequest({required this.state});

  /// Mutable generation state.
  final GenerationState state;
}
