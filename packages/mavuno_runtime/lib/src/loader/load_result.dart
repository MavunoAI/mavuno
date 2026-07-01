import '../model/model.dart';

/// Result returned by a model loader.
///
/// Expected loading failures are represented as values instead of exceptions.
final class LoadResult {
  const LoadResult._({required this.success, this.model, this.message});

  /// Creates a successful load result.
  factory LoadResult.success(Model model) {
    return LoadResult._(success: true, model: model);
  }

  /// Creates a failed load result.
  factory LoadResult.failure(String message) {
    return LoadResult._(success: false, message: message);
  }

  final bool success;

  final Model? model;

  final String? message;

  bool get isSuccess => success;

  bool get isFailure => !success;
}
