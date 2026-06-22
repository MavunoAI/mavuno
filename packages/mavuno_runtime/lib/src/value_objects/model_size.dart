final class ModelManifest {
  const ModelManifest({
    required this.id,
    required this.path,
    required this.contextWindow,
    required this.parameterCount,
    required this.checksum,
  });

  final ModelId id;
  final ModelPath path;
  final ContextWindow contextWindow;
  final ParameterCount parameterCount;
  final Checksum checksum;
}

final class ModelId {
  const ModelId(this.value);

  final String value;
}

final class ModelPath {
  const ModelPath(this.value);

  final String value;
}

final class ParameterCount {
  const ParameterCount(this.value);

  final int value;
}

final class ContextWindow {
  const ContextWindow(this.value);

  final int value;
}

final class Checksum {
  const Checksum(this.value);

  final String value;
}
