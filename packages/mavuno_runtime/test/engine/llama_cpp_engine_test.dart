void main() {}

final class FakeNative {
  bool initialized = false;

  void initialize() {
    initialized = true;
  }

  void main() {}
  void shutdown() {
    initialized = false;
  }
}
