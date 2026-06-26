/// Represents a response returned by the inference backend.
final class InferenceResponse {
  const InferenceResponse({required this.text});

  /// Generated response text.
  final String text;
}
