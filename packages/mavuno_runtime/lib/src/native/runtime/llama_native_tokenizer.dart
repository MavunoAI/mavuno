import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';

import '../../model/model_handle.dart';
import '../../prompt/prompt.dart';
import '../../token/token.dart';
import '../../token/token_sequence.dart';

import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_exception.dart';

import 'native_tokenizer.dart';

const int _defaultTokenizationMaxTokens = 2048;

/// Options controlling native tokenization.
final class TokenizationOptions {
  const TokenizationOptions({
    this.maxTokens = _defaultTokenizationMaxTokens,
    this.addBos = true,
    this.parseSpecial = true,
  });

  final int maxTokens;
  final bool addBos;
  final bool parseSpecial;
}

final class LlamaNativeTokenizer implements NativeTokenizer {
  LlamaNativeTokenizer(this._compat, {this.options = const TokenizationOptions()});

  final LlamaCompat _compat;

  final TokenizationOptions options;

  @override
  TokenSequence tokenize(ModelHandle model, Prompt prompt) {
    final vocab = _compat.vocabulary(model.cast<llama_model>());

    final text = prompt.text.toNativeUtf8(allocator: malloc);

    final nativeTokens = malloc<llama_token>(options.maxTokens);

    try {
      final count = _compat.tokenize(
        vocab,
        text.cast(),
        prompt.text.length,
        nativeTokens,
        options.maxTokens,
        options.addBos,
        options.parseSpecial,
      );

      if (count < 0) {
        throw NativeException(
          code: NativeErrorCode.tokenizationFailed,
          message: 'Failed to tokenize prompt.',
        );
      }

      final tokens = List<Token>.generate(count, (index) => Token(nativeTokens[index]));

      return TokenSequence(tokens);
    } finally {
      malloc.free(nativeTokens);
      malloc.free(text);
    }
  }
}
