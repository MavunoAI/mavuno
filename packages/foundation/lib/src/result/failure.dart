part of 'result.dart';

final class Failure<T> {
  const Failure(this.message);

  final String message;

  bool get isSuccess => false;
}
