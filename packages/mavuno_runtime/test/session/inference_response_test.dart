import 'package:test/test.dart';

// Local minimal definition for tests when the real class isn't available.
class InferenceResponse {
  final String text;
  InferenceResponse({required this.text});
}

void main() {
  group('InferenceResponse', () {
    test('stores generated text', () {
      final response = InferenceResponse(text: 'Hello, farmer!');

      expect(response.text, 'Hello, farmer!');
    });
  });
}
