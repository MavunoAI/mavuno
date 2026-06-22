import 'package:test/test.dart';

class Success<T> {
  final T value;

  const Success(this.value);

  bool get isSuccess => true;
}

class Failure<T> {
  final String message;

  const Failure(this.message);

  bool get isFailure => true;
}

void main() {
  test('Success reports success', () {
    const result = Success<int>(10);

    expect(result.isSuccess, isTrue);
    expect(result.value, 10);
  });

  test('Failure reports failure', () {
    final result = Failure<int>('error');

    expect(result.isFailure, isTrue);
    expect(result.message, 'error');
  });
}
