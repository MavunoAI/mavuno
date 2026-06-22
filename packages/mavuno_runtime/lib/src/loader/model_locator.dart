/// Finds candidate model files.
///
/// Responsible only for discovery.
/// It performs no validation.
abstract interface class ModelLocator {
  /// Attempts to locate a model.
  ///
  /// Returns null if the model cannot be found.
  Future<String?> locate(String modelId);
}
