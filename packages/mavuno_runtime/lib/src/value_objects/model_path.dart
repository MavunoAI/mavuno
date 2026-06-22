import 'dart:io';

import 'package:mavuno_foundation/mavuno_foundation.dart';

/// Represents the filesystem location of a model.
///
/// A [ModelPath] is immutable and identifies where a model is stored
/// on the local device.
final class ModelPath implements ValueObject {
  ModelPath(String value) : value = value.trim() {
    if (this.value.isEmpty) {
      throw ArgumentError.value(value, 'value', 'ModelPath cannot be empty.');
    }
  }

  /// Absolute or relative filesystem path.
  final String value;

  /// Returns the path as a [File].
  File toFile() => File(value);

  @override
  bool operator ==(Object other) => other is ModelPath && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
