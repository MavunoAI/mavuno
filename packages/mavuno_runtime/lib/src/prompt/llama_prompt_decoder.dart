import '../inference/decode_request.dart';
import '../native/runtime/native_decoder.dart';

import 'prompt_decode_request.dart';
import 'prompt_decode_result.dart';
import 'prompt_decoder.dart';

final class LlamaPromptDecoder implements PromptDecoder {
  const LlamaPromptDecoder({required NativeDecoder decoder}) : _decoder = decoder;

  final NativeDecoder _decoder;

  @override
  PromptDecodeResult decode(PromptDecodeRequest request) {
    final logits = _decoder.decode(
      DecodeRequest(session: request.state.session, tokens: request.state.snapshot()),
    );

    request.state.markPromptDecoded();

    return PromptDecodeResult(logits: logits);
  }
}
