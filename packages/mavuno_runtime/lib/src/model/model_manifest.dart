import 'entities/model.dart';
import 'model_format.dart';
import 'model_metadata.dart';

final class ModelManifest {
  const ModelManifest({required this.model, required this.metadata, required this.format});

  final Model model;
  final ModelMetadata metadata;
  final ModelFormat format;
}
