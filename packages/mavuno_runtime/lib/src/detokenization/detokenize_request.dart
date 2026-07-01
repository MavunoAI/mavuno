import '../model/model_handle.dart';
import '../token/token_sequence.dart';

final class DetokenizeRequest {
  const DetokenizeRequest({required this.model, required this.tokens});

  final ModelHandle model;

  final TokenSequence tokens;
}
