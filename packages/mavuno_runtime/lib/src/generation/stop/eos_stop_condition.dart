import '../../token/token.dart';
import '../generation_state.dart';

import 'stop_condition.dart';

final class EosStopCondition implements StopCondition {
  const EosStopCondition({required this.eosTokenId});

  final int eosTokenId;

  @override
  bool shouldStop({required GenerationState state, required Token latestToken}) {
    return latestToken.id == eosTokenId;
  }
}
