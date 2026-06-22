import 'package:foundation/foundation.dart';
import 'package:test/test.dart';

void main() {
  test('Identifiers compare by value', () {
    const a = Identifier('weather');
    const b = Identifier('weather');

    expect(a, equals(b));
  });
}
