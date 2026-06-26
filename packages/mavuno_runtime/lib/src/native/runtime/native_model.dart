import '../../model/model_handle.dart';

abstract interface class NativeModel {
  ModelHandle load(String path);

  void unload(ModelHandle model);
}
