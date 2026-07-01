import '../native/llama_native.dart';

import 'detokenize_request.dart';
import 'detokenize_result.dart';
import 'detokenizer.dart';
import 'generated_text.dart';

final class LlamaDetokenizer implements Detokenizer {
  const LlamaDetokenizer({required LlamaNative native}) : _native = native;

  final LlamaNative _native;

  @override
  DetokenizeResult detokenize(DetokenizeRequest request) {
    final text = _native.detokenize(request.model, request.tokens);

    return DetokenizeResult(text: GeneratedText(text));
  }
}
