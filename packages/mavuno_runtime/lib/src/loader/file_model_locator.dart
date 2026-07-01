import 'dart:io';

import 'model_locator.dart';

final class FileModelLocator implements ModelLocator {
  const FileModelLocator({required this.searchDirectories});

  /// Default search locations used by the runtime.
  factory FileModelLocator.standard() {
    return FileModelLocator(searchDirectories: [Directory('models'), Directory('../../models')]);
  }

  final List<Directory> searchDirectories;

  @override
  Future<String?> locate(String modelId) async {
    for (final directory in searchDirectories) {
      if (!await directory.exists()) {
        continue;
      }

      await for (final entity in directory.list(recursive: true)) {
        if (entity is! File) {
          continue;
        }

        if (!entity.path.toLowerCase().endsWith('.gguf')) {
          continue;
        }

        final filename = entity.uri.pathSegments.last;

        if (filename.contains(modelId)) {
          return entity.absolute.path;
        }
      }
    }

    return null;
  }
}
