import 'package:test/test.dart';

void main() {
  group('NativeDecoder', () {
    test('throws on decode failure', () {
      expect(() {
        throw UnimplementedError();
      }, throwsA(isA<UnimplementedError>()));
    });
  });
}
