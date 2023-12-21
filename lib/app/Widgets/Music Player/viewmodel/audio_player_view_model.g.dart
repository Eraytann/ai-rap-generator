// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AudioPlayerViewModel on _AudioPlayerViewModelBase, Store {
  late final _$positionAtom =
      Atom(name: '_AudioPlayerViewModelBase.position', context: context);

  @override
  Duration get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_AudioPlayerViewModelBase.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$isAudioPlayingAtom =
      Atom(name: '_AudioPlayerViewModelBase.isAudioPlaying', context: context);

  @override
  bool get isAudioPlaying {
    _$isAudioPlayingAtom.reportRead();
    return super.isAudioPlaying;
  }

  @override
  set isAudioPlaying(bool value) {
    _$isAudioPlayingAtom.reportWrite(value, super.isAudioPlaying, () {
      super.isAudioPlaying = value;
    });
  }

  late final _$isPausedAtom =
      Atom(name: '_AudioPlayerViewModelBase.isPaused', context: context);

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$playAudioAsyncAction =
      AsyncAction('_AudioPlayerViewModelBase.playAudio', context: context);

  @override
  Future<void> playAudio(String url) {
    return _$playAudioAsyncAction.run(() => super.playAudio(url));
  }

  late final _$stopAudioAsyncAction =
      AsyncAction('_AudioPlayerViewModelBase.stopAudio', context: context);

  @override
  Future<void> stopAudio() {
    return _$stopAudioAsyncAction.run(() => super.stopAudio());
  }

  late final _$pauseAudioAsyncAction =
      AsyncAction('_AudioPlayerViewModelBase.pauseAudio', context: context);

  @override
  Future<void> pauseAudio() {
    return _$pauseAudioAsyncAction.run(() => super.pauseAudio());
  }

  late final _$resumeAudioAsyncAction =
      AsyncAction('_AudioPlayerViewModelBase.resumeAudio', context: context);

  @override
  Future<void> resumeAudio() {
    return _$resumeAudioAsyncAction.run(() => super.resumeAudio());
  }

  late final _$_AudioPlayerViewModelBaseActionController =
      ActionController(name: '_AudioPlayerViewModelBase', context: context);

  @override
  void audioSeek(Duration position) {
    final _$actionInfo = _$_AudioPlayerViewModelBaseActionController
        .startAction(name: '_AudioPlayerViewModelBase.audioSeek');
    try {
      return super.audioSeek(position);
    } finally {
      _$_AudioPlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_AudioPlayerViewModelBaseActionController
        .startAction(name: '_AudioPlayerViewModelBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AudioPlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
position: ${position},
duration: ${duration},
isAudioPlaying: ${isAudioPlaying},
isPaused: ${isPaused}
    ''';
  }
}
