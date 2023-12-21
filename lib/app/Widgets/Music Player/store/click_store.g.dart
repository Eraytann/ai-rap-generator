// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'click_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClickStore on _ClickStore, Store {
  late final _$isButtonClickedListAtom =
      Atom(name: '_ClickStore.isButtonClickedList', context: context);

  @override
  ObservableList<bool> get isButtonClickedList {
    _$isButtonClickedListAtom.reportRead();
    return super.isButtonClickedList;
  }

  @override
  set isButtonClickedList(ObservableList<bool> value) {
    _$isButtonClickedListAtom.reportWrite(value, super.isButtonClickedList, () {
      super.isButtonClickedList = value;
    });
  }

  late final _$_ClickStoreActionController =
      ActionController(name: '_ClickStore', context: context);

  @override
  void handleIconTap(int index) {
    final _$actionInfo = _$_ClickStoreActionController.startAction(
        name: '_ClickStore.handleIconTap');
    try {
      return super.handleIconTap(index);
    } finally {
      _$_ClickStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonClickedList: ${isButtonClickedList}
    ''';
  }
}
