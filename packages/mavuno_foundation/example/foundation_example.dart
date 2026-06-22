class SemanticVersion {
  final int major;
  final int minor;
  final int patch;

  const SemanticVersion({required this.major, required this.minor, required this.patch});

  @override
  String toString() => '$major.$minor.$patch';
}

class Success<T> {
  final T value;
  const Success(this.value);

  bool get isSuccess => true;
}

void main() {
  const version = SemanticVersion(major: 0, minor: 1, patch: 0);

  const result = Success<String>('Mavuno');

  print(version);

  if (result.isSuccess) {
    print(result.value);
  }
}
