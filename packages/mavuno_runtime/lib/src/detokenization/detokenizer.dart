import 'detokenize_request.dart';
import 'detokenize_result.dart';

abstract interface class Detokenizer {
  DetokenizeResult detokenize(DetokenizeRequest request);
}
