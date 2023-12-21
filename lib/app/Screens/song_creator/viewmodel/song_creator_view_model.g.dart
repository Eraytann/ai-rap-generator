// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_creator_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SongCreatorViewModel on _SongCreatorViewModel, Store {
  late final _$isPlayingAtom =
      Atom(name: '_SongCreatorViewModel.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$isButtonClickedListAtom =
      Atom(name: '_SongCreatorViewModel.isButtonClickedList', context: context);

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

  late final _$dataModelAtom =
      Atom(name: '_SongCreatorViewModel.dataModel', context: context);

  @override
  DataModel? get dataModel {
    _$dataModelAtom.reportRead();
    return super.dataModel;
  }

  @override
  set dataModel(DataModel? value) {
    _$dataModelAtom.reportWrite(value, super.dataModel, () {
      super.dataModel = value;
    });
  }

  late final _$_SongCreatorViewModelActionController =
      ActionController(name: '_SongCreatorViewModel', context: context);

  @override
  void closePage() {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.closePage');
    try {
      return super.closePage();
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopAudio() {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.stopAudio');
    try {
      return super.stopAudio();
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleIconTap(int index) {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.handleIconTap');
    try {
      return super.handleIconTap(index);
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handlePlayButton(int index, String url) {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.handlePlayButton');
    try {
      return super.handlePlayButton(index, url);
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sharePressed() {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.sharePressed');
    try {
      return super.sharePressed();
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteSong(int index) {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.deleteSong');
    try {
      return super.deleteSong(index);
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTitle(TextEditingController controller, int index) {
    final _$actionInfo = _$_SongCreatorViewModelActionController.startAction(
        name: '_SongCreatorViewModel.updateTitle');
    try {
      return super.updateTitle(controller, index);
    } finally {
      _$_SongCreatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
isButtonClickedList: ${isButtonClickedList},
dataModel: ${dataModel}
    ''';
  }
}
