import 'token.dart';

abstract interface class Tokenizer {
  List<Token> tokenize(String text);
}
