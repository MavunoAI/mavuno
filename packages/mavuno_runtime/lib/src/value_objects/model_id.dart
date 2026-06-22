final class ModelId {
  const ModelId(this.value)
    : assert(value.length > 2, 'ModelId must not be empty.');

  final String value;

  @override
  bool operator ==(Object other) => other is ModelId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
