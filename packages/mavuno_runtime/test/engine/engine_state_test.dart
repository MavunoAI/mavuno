import 'package:mavuno_runtime/src/engine/engine_state.dart';
import 'package:test/test.dart';

void main() {
  test('backend lifecycle states exist', () {
    expect(EngineState.values, containsAll([EngineState.uninitialized, EngineState.ready]));
  });
}
