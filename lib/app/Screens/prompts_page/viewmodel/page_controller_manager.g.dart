// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_controller_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageControllerManager on _PageControllerManagerBase, Store {
  Computed<Pages?>? _$selectedSegmentComputed;

  @override
  Pages? get selectedSegment => (_$selectedSegmentComputed ??= Computed<Pages?>(
          () => super.selectedSegment,
          name: '_PageControllerManagerBase.selectedSegment'))
      .value;
  Computed<PageController>? _$pageControllerComputed;

  @override
  PageController get pageController => (_$pageControllerComputed ??=
          Computed<PageController>(() => super.pageController,
              name: '_PageControllerManagerBase.pageController'))
      .value;

  late final _$_selectedSegmentAtom = Atom(
      name: '_PageControllerManagerBase._selectedSegment', context: context);

  @override
  Pages? get _selectedSegment {
    _$_selectedSegmentAtom.reportRead();
    return super._selectedSegment;
  }

  @override
  set _selectedSegment(Pages? value) {
    _$_selectedSegmentAtom.reportWrite(value, super._selectedSegment, () {
      super._selectedSegment = value;
    });
  }

  late final _$pageChangeControlAsyncAction = AsyncAction(
      '_PageControllerManagerBase.pageChangeControl',
      context: context);

  @override
  Future<void> pageChangeControl() {
    return _$pageChangeControlAsyncAction.run(() => super.pageChangeControl());
  }

  late final _$_PageControllerManagerBaseActionController =
      ActionController(name: '_PageControllerManagerBase', context: context);

  @override
  void setSelectedSegment(Pages selectedSegment) {
    final _$actionInfo = _$_PageControllerManagerBaseActionController
        .startAction(name: '_PageControllerManagerBase.setSelectedSegment');
    try {
      return super.setSelectedSegment(selectedSegment);
    } finally {
      _$_PageControllerManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToGeneratedLyricsPage() {
    final _$actionInfo =
        _$_PageControllerManagerBaseActionController.startAction(
            name: '_PageControllerManagerBase.navigateToGeneratedLyricsPage');
    try {
      return super.navigateToGeneratedLyricsPage();
    } finally {
      _$_PageControllerManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToSongPage() {
    final _$actionInfo = _$_PageControllerManagerBaseActionController
        .startAction(name: '_PageControllerManagerBase.navigateToSongPage');
    try {
      return super.navigateToSongPage();
    } finally {
      _$_PageControllerManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToEditLyricsPage() {
    final _$actionInfo =
        _$_PageControllerManagerBaseActionController.startAction(
            name: '_PageControllerManagerBase.navigateToEditLyricsPage');
    try {
      return super.navigateToEditLyricsPage();
    } finally {
      _$_PageControllerManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToRapperPage() {
    final _$actionInfo = _$_PageControllerManagerBaseActionController
        .startAction(name: '_PageControllerManagerBase.navigateToRapperPage');
    try {
      return super.navigateToRapperPage();
    } finally {
      _$_PageControllerManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _navigateToSelectedSegment() {
    final _$actionInfo =
        _$_PageControllerManagerBaseActionController.startAction(
            name: '_PageControllerManagerBase._navigateToSelectedSegment');
    try {
      return super._navigateToSelectedSegment();
    } finally {
      _$_PageControllerManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSegment: ${selectedSegment},
pageController: ${pageController}
    ''';
  }
}
