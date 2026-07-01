import '../../token/token.dart';
import '../generation_state.dart';

import 'stop_condition.dart';

final class MaxTokensStopCondition implements StopCondition {
  const MaxTokensStopCondition(this.maxTokens);

  final int maxTokens;

  @override
  bool shouldStop({required GenerationState state, required Token latestToken}) {
    return state.generatedLength >= maxTokens;
  }
}
