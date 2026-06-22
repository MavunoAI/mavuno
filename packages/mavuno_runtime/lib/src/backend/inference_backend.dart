class BackendType {
  const BackendType();
}

abstract interface class InferenceBackend {
  BackendType get type;
}
