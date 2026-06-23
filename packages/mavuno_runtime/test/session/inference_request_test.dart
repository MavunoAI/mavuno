import 'package:test/test.dart';

class InferenceRequest {
  final String prompt;

  InferenceRequest({required this.prompt});
}

void main() {
  group('InferenceRequest', () {
    test('stores prompt', () {
      final request = InferenceRequest(prompt: 'How do I grow cassava?');

      expect(request.prompt, 'How do I grow cassava?');
    });
  });
}
