import '../generation_state.dart';
import '../../token/token.dart';

abstract interface class StopCondition {
  bool shouldStop({required GenerationState state, required Token latestToken});
}
