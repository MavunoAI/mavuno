import 'dart:io';

final class ModelPath {
  const ModelPath(this.value) : assert(value.length > 1);

  final String value;

  File asFile() => File(value);

  @override
  bool operator ==(Object other) => other is ModelPath && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
