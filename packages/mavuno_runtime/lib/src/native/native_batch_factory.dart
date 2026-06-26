import '../inference/decode_batch.dart';
import 'native_batch.dart';

abstract interface class NativeBatchFactory {
  NativeBatch create(DecodeBatch batch);
}
