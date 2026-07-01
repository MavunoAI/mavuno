import '../../inference/logits.dart';

import '../../session/context_session.dart';

abstract interface class NativeLogitsReader {
  Logits read(ContextSession session);
}
