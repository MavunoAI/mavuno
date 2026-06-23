/// Represents a single inference request.
final class InferenceRequest {
  const InferenceRequest({required this.prompt});

  /// User prompt supplied to the model.
  final String prompt;
}
