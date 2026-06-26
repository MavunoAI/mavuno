import '../../inference/decode_batch.dart';
import '../native_batch.dart';

/// Writes DecodeBatch data into a native llama_batch.
abstract interface class NativeBatchWriter {
  void write({required DecodeBatch source, required NativeBatch destination});
}
