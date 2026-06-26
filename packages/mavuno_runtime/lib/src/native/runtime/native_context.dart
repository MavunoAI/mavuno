import '../../model/model_handle.dart';
import '../../session/context_handle.dart';

abstract interface class NativeContext {
  ContextHandle create(ModelHandle model);

  void destroy(ContextHandle context);
}
