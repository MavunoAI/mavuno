import '../../inference/decode_request.dart';
import '../../inference/logits.dart';
import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as pkgffi;
import '../ffi/llama_bindings.dart';
import '../llama_compat.dart';
import '../native_exception.dart';

import 'native_decoder.dart';
import 'native_logits_reader.dart';

final class LlamaNativeDecoder implements NativeDecoder {
  LlamaNativeDecoder({required LlamaCompat compat, required NativeLogitsReader logitsReader})
    : _compat = compat,

      _logitsReader = logitsReader;

  final LlamaCompat _compat;

  final NativeLogitsReader _logitsReader;

  @override
  Logits decode(DecodeRequest request) {
    final tokenSequence = request.tokens.tokens;

    final tokenBuffer = pkgffi.calloc<llama_token>(tokenSequence.length);

    try {
      for (var i = 0; i < tokenSequence.length; i++) {
        tokenBuffer[i] = tokenSequence[i].id;
      }

      final batch = _compat.createSingleTokenBatch(tokenBuffer, tokenSequence.length);

      final result = _compat.decode(request.session.context.cast<llama_context>(), batch);

      if (result != 0) {
        throw NativeException(
          code: NativeErrorCode.decodeFailed,
          message: 'llama_decode() failed.',
        );
      }

      return _logitsReader.read(request.session);
    } finally {
      pkgffi.calloc.free(tokenBuffer);
    }
  }
}
