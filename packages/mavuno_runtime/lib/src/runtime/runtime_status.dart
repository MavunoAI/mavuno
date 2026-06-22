import 'runtime_state.dart';

final class RuntimeStatus {
  const RuntimeStatus({required this.state, required this.message});

  final RuntimeState state;

  final String message;

  bool get isReady => state == RuntimeState.ready;

  bool get isBusy => state == RuntimeState.busy;

  bool get isDisposed => state == RuntimeState.disposed;
}
