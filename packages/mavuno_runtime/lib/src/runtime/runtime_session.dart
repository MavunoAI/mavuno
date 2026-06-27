import '../model/model_handle.dart';
import '../native/llama_native.dart';
import '../session/context_handle.dart';

/// Owns the lifetime of the native llama.cpp runtime resources.
///
/// A RuntimeSession is responsible for:
/// - initializing the native backend;
/// - loading a GGUF model;
/// - creating a context;
/// - releasing all native resources in the correct order.
///
/// It intentionally does not perform inference.
/// Generation remains the responsibility of Runtime/Generator.
final class RuntimeSession {
  RuntimeSession(this._native);

  final LlamaNative _native;

  ModelHandle? _model;
  ContextHandle? _context;

  bool _opened = false;
  bool _closed = false;

  bool get isOpen => _opened && !_closed;

  ModelHandle get model {
    final model = _model;
    if (model == null) {
      throw StateError('RuntimeSession has not been opened.');
    }
    return model;
  }

  ContextHandle get context {
    final context = _context;
    if (context == null) {
      throw StateError('RuntimeSession has not been opened.');
    }
    return context;
  }

  /// Initializes llama.cpp and loads the supplied GGUF model.
  Future<void> open({required String modelPath}) async {
    if (_opened) {
      throw StateError('RuntimeSession is already open.');
    }

    _native.initialize();

    final loadedModel = _native.loadModel(modelPath);
    final createdContext = _native.createContext(loadedModel);

    _model = loadedModel;
    _context = createdContext;

    _opened = true;
  }

  /// Releases all native resources.
  ///
  /// Safe to call multiple times.
  void close() {
    if (_closed) {
      return;
    }

    final context = _context;
    if (context != null && context.isValid) {
      _native.destroyContext(context);
    }

    final model = _model;
    if (model != null && model.isValid) {
      _native.unloadModel(model);
    }

    _native.shutdown();

    _context = null;
    _model = null;
    _closed = true;
  }
}
