import '../token/token.dart';
import 'logits.dart';

abstract interface class Sampler {
  Token sample(Logits logits);
}
