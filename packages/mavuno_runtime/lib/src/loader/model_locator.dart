/// Finds candidate model files.
///
/// This component is responsible only for discovery.
/// It performs no validation.
abstract interface class ModelLocator {
  /// Attempts to locate a model.
  ///
  /// Returns null when the model cannot be found.
  Future<String?> locate(String modelId);
}
