import 'dart:async';

import 'package:get_it/get_it.dart' as get_it;
import 'package:service_locator/src/service_locator.dart';

/// A compatibility layer between [ServiceLocator] and [get_it.GetIt] from
/// `package:get_it`.
@Deprecated(
    'Only serves as a compatibility layer. Prefer using ServiceLocator.')
class GetIt implements get_it.GetIt {
  static final instance = GetIt();
  static GetIt get I => instance;

  ServiceLocator _locator = ServiceLocator();

  /// The [ServiceLocator] backing this implementation of [GetIt].
  ServiceLocator get locator => _locator;

  @override
  void registerLazySingleton<T extends Object>(
    get_it.FactoryFunc<T> factoryFunc, {
    String? instanceName,
    get_it.DisposingFunc<T>? dispose,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (dispose != null) {
      throw UnimplementedError('dispose');
    }

    locator.registerFactory(factoryFunc);
  }

  @override
  void registerLazySingletonAsync<T extends Object>(
    get_it.FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    get_it.DisposingFunc<T>? dispose,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (dispose != null) {
      throw UnimplementedError('dispose');
    }

    locator.registerFactory(factoryFunc, forceAsync: true);
  }

  @override
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    get_it.DisposingFunc<T>? dispose,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (signalsReady != null) {
      throw UnimplementedError('signalsReady');
    }

    if (dispose != null) {
      throw UnimplementedError('dispose');
    }

    locator.registerInstance(instance);
  }

  @override
  void registerSingletonAsync<T extends Object>(
    get_it.FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    get_it.DisposingFunc<T>? dispose,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (dependsOn != null) {
      throw UnimplementedError('dependsOn');
    }

    if (signalsReady != null) {
      throw UnimplementedError('signalsReady');
    }

    if (dispose != null) {
      throw UnimplementedError('dispose');
    }

    locator.registerFactory(factoryFunc, forceAsync: true);
  }

  @override
  void registerSingletonWithDependencies<T extends Object>(
    get_it.FactoryFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    get_it.DisposingFunc<T>? dispose,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (dependsOn != null) {
      throw UnimplementedError('dependsOn');
    }

    if (signalsReady != null) {
      throw UnimplementedError('signalsReady');
    }

    if (dispose != null) {
      throw UnimplementedError('dispose');
    }

    locator.registerFactory(factoryFunc);
  }

  @override
  void registerFactory<T extends Object>(
    get_it.FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    locator.registerFactory(factoryFunc, cacheInstance: false);
  }

  @override
  void registerFactoryAsync<T extends Object>(
    get_it.FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
  }) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    locator.registerFactory(
      factoryFunc,
      cacheInstance: false,
      forceAsync: true,
    );
  }

  @override
  Future<void> reset({bool? dispose}) async {
    if (dispose != null) {
      throw UnimplementedError('dispose');
    }

    _locator = ServiceLocator();
  }

  @override
  T call<T extends Object>({String? instanceName, param1, param2}) {
    return get<T>(instanceName: instanceName, param1: param1, param2: param2);
  }

  @override
  T get<T extends Object>({String? instanceName, param1, param2}) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (param1 != null) {
      throw UnimplementedError('param1');
    }

    if (param2 != null) {
      throw UnimplementedError('param2');
    }

    return locator.get<T>();
  }

  @override
  Future<T> getAsync<T extends Object>({String? instanceName, param1, param2}) {
    if (instanceName != null) {
      throw UnimplementedError('instanceName');
    }

    if (param1 != null) {
      throw UnimplementedError('param1');
    }

    if (param2 != null) {
      throw UnimplementedError('param2');
    }

    return locator.getAsync<T>();
  }

  // ------------------------------------------
  //          Currently unimplemented
  // ------------------------------------------

  @override
  bool get allowReassignment => throw UnimplementedError();

  @override
  set allowReassignment(bool value) => throw UnimplementedError();

  @override
  void Function(bool pushed)? get onScopeChanged => throw UnimplementedError();

  @override
  set onScopeChanged(void Function(bool pushed)? value) =>
      throw UnimplementedError();

  @override
  Future<void> allReady({
    Duration? timeout,
    bool ignorePendingAsyncCreation = false,
  }) {
    // TODO: implement allReady
    throw UnimplementedError();
  }

  @override
  bool allReadySync([bool ignorePendingAsyncCreation = false]) {
    // TODO: implement allReadySync
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentScopeName
  String? get currentScopeName => throw UnimplementedError();

  @override
  Future<void> isReady<T extends Object>({
    Object? instance,
    String? instanceName,
    Duration? timeout,
    Object? callee,
  }) {
    // TODO: implement isReady
    throw UnimplementedError();
  }

  @override
  bool isReadySync<T extends Object>({Object? instance, String? instanceName}) {
    // TODO: implement isReadySync
    throw UnimplementedError();
  }

  @override
  bool isRegistered<T extends Object>(
      {Object? instance, String? instanceName}) {
    // TODO: implement isRegistered
    throw UnimplementedError();
  }

  @override
  Future<void> popScope() {
    // TODO: implement popScope
    throw UnimplementedError();
  }

  @override
  Future<bool> popScopesTill(String name) {
    // TODO: implement popScopesTill
    throw UnimplementedError();
  }

  @override
  void pushNewScope({
    void Function(get_it.GetIt getIt)? init,
    String? scopeName,
    get_it.ScopeDisposeFunc? dispose,
  }) {
    // TODO: implement pushNewScope
    throw UnimplementedError();
  }

  @override
  void registerFactoryParam<T extends Object, P1, P2>(
    get_it.FactoryFuncParam<T, P1, P2> factoryFunc, {
    String? instanceName,
  }) {
    // TODO: implement registerFactoryParam
    throw UnimplementedError();
  }

  @override
  void registerFactoryParamAsync<T extends Object, P1, P2>(
    get_it.FactoryFuncParamAsync<T, P1?, P2?> factoryFunc, {
    String? instanceName,
  }) {
    // TODO: implement registerFactoryParamAsync
    throw UnimplementedError();
  }

  @override
  FutureOr<dynamic> resetLazySingleton<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr<dynamic> Function(T p1)? disposingFunction,
  }) {
    // TODO: implement resetLazySingleton
    throw UnimplementedError();
  }

  @override
  Future<void> resetScope({bool dispose = true}) {
    // TODO: implement resetScope
    throw UnimplementedError();
  }

  @override
  void signalReady(Object? instance) {
    // TODO: implement signalReady
    throw UnimplementedError();
  }

  @override
  FutureOr<dynamic> unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr<dynamic> Function(T p1)? disposingFunction,
  }) {
    // TODO: implement unregister
    throw UnimplementedError();
  }
}
