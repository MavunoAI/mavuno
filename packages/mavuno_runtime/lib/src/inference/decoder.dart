import 'decode_request.dart';
import 'logits.dart';

/// Executes one forward pass through the transformer.
abstract interface class Decoder {
  Logits decode(DecodeRequest request);
}
