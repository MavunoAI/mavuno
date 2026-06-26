/// Configuration options for a generation request.
final class GenerationOptions {
  const GenerationOptions({this.maxTokens = 128});

  final int maxTokens;
}
