import '../inference/decode_request.dart';
import '../native/runtime/native_decoder.dart';

import 'token_decode_request.dart';
import 'token_decode_result.dart';
import 'token_decoder.dart';

final class LlamaTokenDecoder implements TokenDecoder {
  const LlamaTokenDecoder({required NativeDecoder decoder}) : _decoder = decoder;

  final NativeDecoder _decoder;

  @override
  TokenDecodeResult decode(TokenDecodeRequest request) {
    final logits = _decoder.decode(
      DecodeRequest(session: request.state.session, tokens: request.state.snapshot()),
    );

    return TokenDecodeResult(logits: logits);
  }
}
