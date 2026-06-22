import 'package:mavuno_runtime/mavuno_runtime.dart';
import 'package:test/test.dart';

final class FakeLoader {
  FakeLoader(this.result);

  final LoadResult result;

  LoadResult? last;

  Future<LoadResult> load() async {
    // ModelLoader.load has no parameters in the contract; ignore manifest here.
    last = result;
    return result;
  }
}

void main() {
  test('returns configured result', () async {
    const model = Model(id: 'llama-3b', path: '/models/llama-3b.gguf');

    // metadata not required for this contract test

    final loader = FakeLoader(LoadResult.success(model));

    await loader.load();

    final result = loader.last!;

    expect(result.isSuccess, isTrue);
    expect(result.model, equals(model));
  });
}
