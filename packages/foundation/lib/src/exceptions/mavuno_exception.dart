class MavunoException implements Exception {
  const MavunoException(this.message);

  final String message;

  @override
  String toString() => message;
}
