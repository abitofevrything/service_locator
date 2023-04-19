import 'dart:async';
import 'dart:collection';

import 'package:runtime_type/runtime_type.dart';
import 'package:service_locator/src/exceptions.dart';
import 'package:service_locator/src/service_factory.dart';

const futureType = RuntimeType<Future<Object>>.allowingDynamic();

class ServiceLocator {
  final HashMap<RuntimeType<Object>, ServiceFactory<Object>> _factories =
      HashMap();
  final HashMap<RuntimeType<Future<Object>>, ServiceFactory<Object>>
      _asyncFactories = HashMap();

  T get<T extends Object>() {
    final type = RuntimeType<T>();

    if (type.isSubtypeOf(futureType)) {
      // Wrap with Future.value in case the factory's async instance type is a
      // non-future (as it is with all the sync factories) and T is Future.
      // T could be FutureOr, in which case this is unnecessary, but best be
      // safe.
      return Future.value(_asyncFactories[type]!.asyncInstance) as T;
    }

    return _factories[RuntimeType<T>()]!.instance as T;
  }

  Future<T> getAsync<T extends Object>() => get<Future<T>>();

  void registerInstance<T extends Object>(T instance) {
    final factory = InstanceFactory(instance);

    registerServiceFactory(factory);
  }

  void registerFactory<T extends Object>(
    FutureOr<T> Function() factory, {
    bool forceAsync = false,
    bool cacheInstance = true,
  }) {
    final ServiceFactory<T> wrapper;

    if (!forceAsync && factory is T Function()) {
      wrapper =
          cacheInstance ? CachingSyncFactory(factory) : SyncFactory(factory);
    } else {
      wrapper =
          cacheInstance ? CachingAsyncFactory(factory) : AsyncFactory(factory);
    }

    registerServiceFactory(wrapper);
  }

  void registerServiceFactory<T extends Object>(ServiceFactory<T> factory) {
    var type = factory.type;
    var asyncType = factory.asyncType;
    final typeParameter = RuntimeType<T>();

    // This can happen when registering mocks - for example, passing a
    // ServiceFactory<MockApi> but passing Api as T means that we wish to mock
    // the Api service with MockApi, so we use that type instead.
    if (typeParameter.isSupertypeOf(type)) {
      type = typeParameter;
      asyncType = RuntimeType<Future<T>>();
    }

    assert(() {
      if (type.isSubtypeOf(futureType)) {
        throw UsageError(
          'Attempting to register a factory for ${type.internalType}.'
          "\nThis is most likely a mistake. If it's intentional, consider using"
          '`registerFactory` with a function that returns the future instead.',
        );
      }

      return true;
    }());

    _factories[type] = factory;
    _asyncFactories[asyncType] = factory;
  }
}
