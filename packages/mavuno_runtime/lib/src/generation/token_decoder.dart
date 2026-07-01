import 'token_decode_request.dart';
import 'token_decode_result.dart';

abstract interface class TokenDecoder {
  TokenDecodeResult decode(TokenDecodeRequest request);
}
