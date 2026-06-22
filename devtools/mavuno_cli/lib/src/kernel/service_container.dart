class ServiceContainer {
  final Map<Type, Object> _services = {};

  void register<T extends Object>(T service) {
    _services[T] = service;
  }

  T resolve<T extends Object>() {
    final service = _services[T];
    if (service == null) {
      throw StateError('Service $T is not registered.');
    }
    return service as T;
  }
}
