// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageStore on _PageStoreBase, Store {
  late final _$currentGradientAtom =
      Atom(name: '_PageStoreBase.currentGradient', context: context);

  @override
  LinearGradient? get currentGradient {
    _$currentGradientAtom.reportRead();
    return super.currentGradient;
  }

  @override
  set currentGradient(LinearGradient? value) {
    _$currentGradientAtom.reportWrite(value, super.currentGradient, () {
      super.currentGradient = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_PageStoreBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$parsedTextAtom =
      Atom(name: '_PageStoreBase.parsedText', context: context);

  @override
  List<String> get parsedText {
    _$parsedTextAtom.reportRead();
    return super.parsedText;
  }

  @override
  set parsedText(List<String> value) {
    _$parsedTextAtom.reportWrite(value, super.parsedText, () {
      super.parsedText = value;
    });
  }

  late final _$_PageStoreBaseActionController =
      ActionController(name: '_PageStoreBase', context: context);

  @override
  void setCurrentPage(int value) {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void parseText(String text) {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.parseText');
    try {
      return super.parseText(text);
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeButtonColor() {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.changeButtonColor');
    try {
      return super.changeButtonColor();
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finalFunc() {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.finalFunc');
    try {
      return super.finalFunc();
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentGradient: ${currentGradient},
currentPage: ${currentPage},
parsedText: ${parsedText}
    ''';
  }
}
