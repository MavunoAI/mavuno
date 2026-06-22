final class Checksum {
  const Checksum(this.value) : assert(value.length >= 32);

  final String value;

  @override
  String toString() => value;
}
