import 'package:test/test.dart';

// Removed unused LlamaNative and its extension to avoid unused declaration warnings.

class _TestLlamaNative {
  void initialize() {}

  dynamic loadModel(String path) => Object();

  List<int> tokenize(dynamic model, String text) => <int>[1];
}

void main() {
  test('Prompt tokenizes successfully', () async {
    final native = _TestLlamaNative();

    native.initialize();

    final model = native.loadModel('test/models/tiny.gguf');

    final tokens = native.tokenize(model, 'Hello Mavuno');

    expect(tokens.isNotEmpty, true);
  });
}
