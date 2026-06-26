// Minimal ModelHandle used for tests in this file.
final class ModelHandle {
  final String identifier;
  const ModelHandle._({required this.identifier});
}

void main() {}

final class FakeNative {
  void initialize() {}

  void shutdown() {}

  ModelHandle loadModel(String path) {
    return const ModelHandle._(identifier: 'fake');
  }
}
