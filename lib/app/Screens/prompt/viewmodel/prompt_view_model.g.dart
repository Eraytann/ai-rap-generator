// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PromptViewModel on _PromptViewModelBase, Store {
  late final _$currentTextAtom =
      Atom(name: '_PromptViewModelBase.currentText', context: context);

  @override
  String get currentText {
    _$currentTextAtom.reportRead();
    return super.currentText;
  }

  @override
  set currentText(String value) {
    _$currentTextAtom.reportWrite(value, super.currentText, () {
      super.currentText = value;
    });
  }

  late final _$newTextFieldValueAtom =
      Atom(name: '_PromptViewModelBase.newTextFieldValue', context: context);

  @override
  String get newTextFieldValue {
    _$newTextFieldValueAtom.reportRead();
    return super.newTextFieldValue;
  }

  @override
  set newTextFieldValue(String value) {
    _$newTextFieldValueAtom.reportWrite(value, super.newTextFieldValue, () {
      super.newTextFieldValue = value;
    });
  }

  late final _$clickedButtonIndexAtom =
      Atom(name: '_PromptViewModelBase.clickedButtonIndex', context: context);

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

  late final _$_PromptViewModelBaseActionController =
      ActionController(name: '_PromptViewModelBase', context: context);

  @override
  void updateGrid(String text) {
    final _$actionInfo = _$_PromptViewModelBaseActionController.startAction(
        name: '_PromptViewModelBase.updateGrid');
    try {
      return super.updateGrid(text);
    } finally {
      _$_PromptViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTextChanged(String textFieldValue) {
    final _$actionInfo = _$_PromptViewModelBaseActionController.startAction(
        name: '_PromptViewModelBase.onTextChanged');
    try {
      return super.onTextChanged(textFieldValue);
    } finally {
      _$_PromptViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLabelSelected(String label) {
    final _$actionInfo = _$_PromptViewModelBaseActionController.startAction(
        name: '_PromptViewModelBase.onLabelSelected');
    try {
      return super.onLabelSelected(label);
    } finally {
      _$_PromptViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getLyricByGenre(SongGenre genre) {
    final _$actionInfo = _$_PromptViewModelBaseActionController.startAction(
        name: '_PromptViewModelBase.getLyricByGenre');
    try {
      return super.getLyricByGenre(genre);
    } finally {
      _$_PromptViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClickedButtonIndex(int index) {
    final _$actionInfo = _$_PromptViewModelBaseActionController.startAction(
        name: '_PromptViewModelBase.setClickedButtonIndex');
    try {
      return super.setClickedButtonIndex(index);
    } finally {
      _$_PromptViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentText: ${currentText},
newTextFieldValue: ${newTextFieldValue},
clickedButtonIndex: ${clickedButtonIndex}
    ''';
  }
}
