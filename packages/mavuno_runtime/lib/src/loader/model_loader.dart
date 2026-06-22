class ModelManifest {}

abstract interface class ModelLoader {
  Future<void> load(ModelManifest manifest);
}
