import '../../native/llama_native.dart';
import '../generation_request.dart';

import 'composite_stop_condition.dart';
import 'max_tokens_stop_condition.dart';
import 'stop_condition.dart';
import 'stop_condition_factory.dart';
import 'eos_stop_condition.dart';

final class DefaultStopConditionFactory implements StopConditionFactory {
  DefaultStopConditionFactory({required LlamaNative native}) : _native = native;

  final LlamaNative _native;

  @override
  StopCondition create(GenerationRequest request) {
    return CompositeStopCondition([
      MaxTokensStopCondition(request.maxTokens),
      EosStopCondition(eosTokenId: _native.eosToken(request.model)),
    ]);
  }
}
