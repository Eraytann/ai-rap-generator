// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingViewModel on _OnboardingViewModelBase, Store {
  late final _$gptResponseStoreAtom =
      Atom(name: '_OnboardingViewModelBase.gptResponseStore', context: context);

  @override
  GPTResponseViewModel get gptResponseStore {
    _$gptResponseStoreAtom.reportRead();
    return super.gptResponseStore;
  }

  @override
  set gptResponseStore(GPTResponseViewModel value) {
    _$gptResponseStoreAtom.reportWrite(value, super.gptResponseStore, () {
      super.gptResponseStore = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_OnboardingViewModelBase.currentPage', context: context);

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

  late final _$_OnboardingViewModelBaseActionController =
      ActionController(name: '_OnboardingViewModelBase', context: context);

  @override
  void setCurrentPage(int page) {
    final _$actionInfo = _$_OnboardingViewModelBaseActionController.startAction(
        name: '_OnboardingViewModelBase.setCurrentPage');
    try {
      return super.setCurrentPage(page);
    } finally {
      _$_OnboardingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gptResponseStore: ${gptResponseStore},
currentPage: ${currentPage}
    ''';
  }
}
