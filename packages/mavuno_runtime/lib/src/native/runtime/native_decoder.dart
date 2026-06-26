import '../../inference/decode_request.dart';
import '../../inference/logits.dart';

abstract interface class NativeDecoder {
  Logits decode(DecodeRequest request);
}
