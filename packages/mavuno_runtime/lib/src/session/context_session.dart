import '../model/model_handle.dart';
import 'context_handle.dart';

/// Represents one active inference session.
///
/// A session owns exactly one loaded model and one native inference
/// context.
final class ContextSession {
  const ContextSession({required this.model, required this.context});

  /// Loaded GGUF model.
  final ModelHandle model;

  /// Native inference context.
  final ContextHandle context;

  bool get isValid => model.isValid && context.isValid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContextSession && other.model == model && other.context == context;

  @override
  int get hashCode => Object.hash(model, context);

  @override
  String toString() => 'ContextSession(model: $model, context: $context)';
}
