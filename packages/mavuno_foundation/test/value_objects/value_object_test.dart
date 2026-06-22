import 'package:mavuno_foundation/mavuno_foundation.dart';
import 'package:test/test.dart';

final class TestValueObject implements ValueObject {
  const TestValueObject();
}

void main() {
  test('marker interface can be implemented', () {
    const object = TestValueObject();

    expect(object, isA<ValueObject>());
  });
}
