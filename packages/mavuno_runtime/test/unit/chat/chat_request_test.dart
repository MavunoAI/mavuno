import 'package:mavuno_runtime/src/chat/chat.dart';
import 'package:test/test.dart';

void main() {
  group('ChatRequest', () {
    test('creates chat request with default options', () {
      const request = ChatRequest();

      expect(request.options, isNotNull);
    });

    test('creates chat response', () {
      const response = ChatResponse(text: 'Hello!');

      expect(response.text, 'Hello!');
    });
  });
}
