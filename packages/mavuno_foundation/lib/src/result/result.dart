sealed class Result<T> {
  const Result();

  bool get isSuccess;

  bool get isFailure => !isSuccess;
}
