import 'dart:io';

import '../model/model_manifest.dart';
import 'load_result.dart';
import 'model_loader.dart';

/// Default implementation of [ModelLoader].
///
/// This implementation validates that:
/// - the model file exists;
/// - the file has a `.gguf` extension.
///
/// It does not load the model into memory.
/// It does not invoke llama.cpp.
final class DefaultModelLoader implements ModelLoader {
  final ModelManifest manifest;

  const DefaultModelLoader(this.manifest);

  @override
  Future<LoadResult> load() async {
    final file = File(manifest.model.path);

    if (!await file.exists()) {
      return LoadResult.failure('Model file not found: ${manifest.model.path}');
    }

    if (!file.path.toLowerCase().endsWith('.gguf')) {
      return LoadResult.failure('Unsupported model format. Expected .gguf.');
    }

    return LoadResult.success(manifest.model);
  }
}
