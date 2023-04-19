import 'dart:async';

import 'package:runtime_type/runtime_type.dart';

abstract class ServiceFactory<T extends Object> {
  RuntimeType<T> get type => RuntimeType<T>();
  RuntimeType<Future<T>> get asyncType => RuntimeType<Future<T>>();

  const ServiceFactory();

  T? get instance;

  FutureOr<T> get asyncInstance;
}

class InstanceFactory<T extends Object> extends ServiceFactory<T> {
  @override
  final T instance;

  const InstanceFactory(this.instance);

  @override
  T get asyncInstance => instance;
}

class SyncFactory<T extends Object> extends ServiceFactory<T> {
  final T Function() factory;

  const SyncFactory(this.factory);

  @override
  T get instance => factory();

  @override
  T get asyncInstance => instance;
}

class AsyncFactory<T extends Object> extends ServiceFactory<T> {
  final FutureOr<T> Function() factory;

  const AsyncFactory(this.factory);

  @override
  Null get instance => null;

  @override
  FutureOr<T> get asyncInstance => factory();
}

class CachingSyncFactory<T extends Object> extends ServiceFactory<T> {
  final T Function() factory;

  @override
  late final T instance = factory();

  CachingSyncFactory(this.factory);

  @override
  T get asyncInstance => instance;
}

class CachingAsyncFactory<T extends Object> extends ServiceFactory<T> {
  final FutureOr<T> Function() factory;

  T? _instance;

  @override
  T? get instance => _instance;

  CachingAsyncFactory(this.factory);

  @override
  FutureOr<T> get asyncInstance async => _instance ??= await factory();
}
