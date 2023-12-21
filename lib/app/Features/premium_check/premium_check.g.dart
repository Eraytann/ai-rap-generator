// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_check.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on _CounterStoreBase, Store {
  late final _$navigateAtom =
      Atom(name: '_CounterStoreBase.navigate', context: context);

  @override
  bool get navigate {
    _$navigateAtom.reportRead();
    return super.navigate;
  }

  @override
  set navigate(bool value) {
    _$navigateAtom.reportWrite(value, super.navigate, () {
      super.navigate = value;
    });
  }

  late final _$counterAtom =
      Atom(name: '_CounterStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$decrementCounterAsyncAction =
      AsyncAction('_CounterStoreBase.decrementCounter', context: context);

  @override
  Future<bool> decrementCounter() {
    return _$decrementCounterAsyncAction.run(() => super.decrementCounter());
  }

  late final _$saveCounterToSharedPreferencesAsyncAction = AsyncAction(
      '_CounterStoreBase.saveCounterToSharedPreferences',
      context: context);

  @override
  Future<void> saveCounterToSharedPreferences() {
    return _$saveCounterToSharedPreferencesAsyncAction
        .run(() => super.saveCounterToSharedPreferences());
  }

  @override
  String toString() {
    return '''
navigate: ${navigate},
counter: ${counter}
    ''';
  }
}
