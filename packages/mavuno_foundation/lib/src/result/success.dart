part of 'result.dart';

final class Success<T> {
  const Success(this.value);

  final T value;

  bool get isSuccess => true;
}
