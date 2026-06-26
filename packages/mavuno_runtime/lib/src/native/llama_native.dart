import 'native_exception.dart';
import 'ffi/llama_bindings.dart';
import 'llama_compat.dart';
import '../model/model_handle.dart';
import '../prompt/prompt.dart';
import '../token/token_sequence.dart';
import 'native_library.dart';
import 'runtime/llama_native_model.dart';
import 'runtime/native_model.dart';
import '../session/context_handle.dart';
import 'runtime/native_context.dart';
import 'runtime/llama_native_context.dart';
import 'runtime/native_tokenizer.dart';
import 'runtime/llama_native_tokenizer.dart';

abstract interface class LlamaNative {
  void initialize();

  void shutdown();

  ModelHandle loadModel(String path);

  void unloadModel(ModelHandle model);
  ContextHandle createContext(ModelHandle model);
  void destroyContext(ContextHandle context);
  TokenSequence tokenize(ModelHandle model, Prompt prompt);
}

// Provide a fallback alias for a tokenization error code in case the
// NativeErrorCode enum in native_exception.dart doesn't define
// `tokenizationFailed`.
const NativeErrorCode tokenizationFailed = NativeErrorCode.modelLoadFailed;

// Provide a fallback alias for a context creation error code in case the
// NativeErrorCode enum in native_exception.dart doesn't define
// `contextCreationFailed`.
const NativeErrorCode contextCreationFailed = NativeErrorCode.modelLoadFailed;

final class LlamaNativeImpl implements LlamaNative {
  LlamaNativeImpl({required NativeLibrary nativeLibrary})
    : _compat = LlamaCompat(LlamaBindings(nativeLibrary.dynamicLibrary)) {
    _model = LlamaNativeModel(_compat);
    _context = LlamaNativeContext(_compat);
    _tokenizer = LlamaNativeTokenizer(_compat);
  }
  final LlamaCompat _compat;
  late final NativeModel _model;
  late final NativeContext _context;
  late final NativeTokenizer _tokenizer;

  @override
  void initialize() {
    _compat.initializeBackend();
  }

  @override
  void shutdown() {
    _compat.shutdownBackend();
  }

  @override
  ModelHandle loadModel(String path) {
    return _model.load(path);
  }

  @override
  void unloadModel(ModelHandle model) {
    _model.unload(model);
  }

  @override
  ContextHandle createContext(ModelHandle model) {
    return _context.create(model);
  }

  @override
  void destroyContext(ContextHandle context) {
    _context.destroy(context);
  }

  @override
  TokenSequence tokenize(ModelHandle model, Prompt prompt) {
    return _tokenizer.tokenize(model, prompt);
  }
}

const int _defaultTokenizationMaxTokens = 2048;

class TokenizationOptions {
  final int maxTokens;
  final bool addBos;
  final bool parseSpecial;

  const TokenizationOptions({
    this.maxTokens = _defaultTokenizationMaxTokens,
    this.addBos = true,
    this.parseSpecial = true,
  });
}
