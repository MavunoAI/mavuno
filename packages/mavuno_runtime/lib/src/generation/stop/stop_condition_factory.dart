import '../generation_request.dart';

import 'stop_condition.dart';

abstract interface class StopConditionFactory {
  StopCondition create(GenerationRequest request);
}
