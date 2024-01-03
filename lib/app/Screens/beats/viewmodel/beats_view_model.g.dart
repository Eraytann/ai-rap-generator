// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beats_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeatsViewModel on _BeatsViewModelBase, Store {
  late final _$selectedBeatIndexAtom =
      Atom(name: '_BeatsViewModelBase.selectedBeatIndex', context: context);

  @override
  int get selectedBeatIndex {
    _$selectedBeatIndexAtom.reportRead();
    return super.selectedBeatIndex;
  }

  @override
  set selectedBeatIndex(int value) {
    _$selectedBeatIndexAtom.reportWrite(value, super.selectedBeatIndex, () {
      super.selectedBeatIndex = value;
    });
  }

  late final _$beatAtom =
      Atom(name: '_BeatsViewModelBase.beat', context: context);

  @override
  BeatsViewModel? get beat {
    _$beatAtom.reportRead();
    return super.beat;
  }

  @override
  set beat(BeatsViewModel? value) {
    _$beatAtom.reportWrite(value, super.beat, () {
      super.beat = value;
    });
  }

  late final _$beatsAtom =
      Atom(name: '_BeatsViewModelBase.beats', context: context);

  @override
  List<BackingTrackModel> get beats {
    _$beatsAtom.reportRead();
    return super.beats;
  }

  @override
  set beats(List<BackingTrackModel> value) {
    _$beatsAtom.reportWrite(value, super.beats, () {
      super.beats = value;
    });
  }

  late final _$selectedTrackUUIDAtom =
      Atom(name: '_BeatsViewModelBase.selectedTrackUUID', context: context);

  @override
  String? get selectedTrackUUID {
    _$selectedTrackUUIDAtom.reportRead();
    return super.selectedTrackUUID;
  }

  @override
  set selectedTrackUUID(String? value) {
    _$selectedTrackUUIDAtom.reportWrite(value, super.selectedTrackUUID, () {
      super.selectedTrackUUID = value;
    });
  }

  late final _$fetchBeatsAsyncAction =
      AsyncAction('_BeatsViewModelBase.fetchBeats', context: context);

  @override
  Future<List<BackingTrackModel>> fetchBeats() {
    return _$fetchBeatsAsyncAction.run(() => super.fetchBeats());
  }

  late final _$_BeatsViewModelBaseActionController =
      ActionController(name: '_BeatsViewModelBase', context: context);

  @override
  void setSelectedTrackUUID(String? uuid) {
    final _$actionInfo = _$_BeatsViewModelBaseActionController.startAction(
        name: '_BeatsViewModelBase.setSelectedTrackUUID');
    try {
      return super.setSelectedTrackUUID(uuid);
    } finally {
      _$_BeatsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initService() {
    final _$actionInfo = _$_BeatsViewModelBaseActionController.startAction(
        name: '_BeatsViewModelBase.initService');
    try {
      return super.initService();
    } finally {
      _$_BeatsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onClickControl(BackingTrackModel track, int index) {
    final _$actionInfo = _$_BeatsViewModelBaseActionController.startAction(
        name: '_BeatsViewModelBase.onClickControl');
    try {
      return super.onClickControl(track, index);
    } finally {
      _$_BeatsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBeatIndex: ${selectedBeatIndex},
beat: ${beat},
beats: ${beats},
selectedTrackUUID: ${selectedTrackUUID}
    ''';
  }
}
