import '../../token/token.dart';
import '../generation_state.dart';

import 'stop_condition.dart';

final class CompositeStopCondition implements StopCondition {
  CompositeStopCondition(Iterable<StopCondition> conditions)
    : _conditions = List.unmodifiable(conditions);

  final List<StopCondition> _conditions;

  @override
  bool shouldStop({required GenerationState state, required Token latestToken}) {
    for (final condition in _conditions) {
      if (condition.shouldStop(state: state, latestToken: latestToken)) {
        return true;
      }
    }

    return false;
  }
}
