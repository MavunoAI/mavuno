import '../../inference/logits.dart';

final class NativeDecodeResult {
  const NativeDecodeResult({required this.logits});

  final Logits logits;
}
