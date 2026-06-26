import '../token/token.dart';

/// Platform-independent representation of a decoder batch.
///
/// This class contains no native pointers and can be freely
/// unit tested.
final class DecodeBatch {
  const DecodeBatch({
    required this.tokens,
    required this.positions,
    required this.sequenceIds,
    required this.requestLogits,
  });

  final List<Token> tokens;
  final List<int> positions;
  final List<int> sequenceIds;
  final List<bool> requestLogits;

  int get length => tokens.length;

  bool get isEmpty => tokens.isEmpty;

  bool get isNotEmpty => tokens.isNotEmpty;

  bool get isValid =>
      tokens.length == positions.length &&
      tokens.length == sequenceIds.length &&
      tokens.length == requestLogits.length;
}
