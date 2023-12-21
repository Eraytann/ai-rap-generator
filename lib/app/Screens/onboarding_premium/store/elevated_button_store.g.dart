// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elevated_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ElevatedButtonStore on _ElevatedButtonStore, Store {
  late final _$clickedButtonIndexAtom =
      Atom(name: '_ElevatedButtonStore.clickedButtonIndex', context: context);

  @override
  int get clickedButtonIndex {
    _$clickedButtonIndexAtom.reportRead();
    return super.clickedButtonIndex;
  }

  @override
  set clickedButtonIndex(int value) {
    _$clickedButtonIndexAtom.reportWrite(value, super.clickedButtonIndex, () {
      super.clickedButtonIndex = value;
    });
  }

  late final _$counterAtom =
      Atom(name: '_ElevatedButtonStore.counter', context: context);

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

  late final _$saveCounterToSharedPreferencesAsyncAction = AsyncAction(
      '_ElevatedButtonStore.saveCounterToSharedPreferences',
      context: context);

  @override
  Future<void> saveCounterToSharedPreferences() {
    return _$saveCounterToSharedPreferencesAsyncAction
        .run(() => super.saveCounterToSharedPreferences());
  }

  late final _$_ElevatedButtonStoreActionController =
      ActionController(name: '_ElevatedButtonStore', context: context);

  @override
  void setClickedButtonIndex(int index) {
    final _$actionInfo = _$_ElevatedButtonStoreActionController.startAction(
        name: '_ElevatedButtonStore.setClickedButtonIndex');
    try {
      return super.setClickedButtonIndex(index);
    } finally {
      _$_ElevatedButtonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clickedButtonIndex: ${clickedButtonIndex},
counter: ${counter}
    ''';
  }
}
