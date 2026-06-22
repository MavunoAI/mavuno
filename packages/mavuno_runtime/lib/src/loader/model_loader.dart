import 'load_result.dart';

/// Loads and validates a model manifest.
///
/// Implementations may validate:
/// - file existence
/// - file format
/// - checksum
///
/// Loading does NOT create an inference session.
abstract interface class ModelLoader {
  Future<LoadResult> load();
}
