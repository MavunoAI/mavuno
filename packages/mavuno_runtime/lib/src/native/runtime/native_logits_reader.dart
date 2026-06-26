import '../../inference/logits.dart';
import '../../session/context_handle.dart';

abstract interface class NativeLogitsReader {
  Logits read(ContextHandle context);
}
