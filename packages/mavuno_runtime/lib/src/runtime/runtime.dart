import '../model/model_manifest.dart';

enum RuntimeStatus { uninitialized, initialized, shuttingDown, terminated }

abstract interface class Runtime {
  RuntimeStatus get status;

  Future<void> initialize();

  Future<void> shutdown();

  Future<dynamic> createSession(ModelManifest manifest);
}
