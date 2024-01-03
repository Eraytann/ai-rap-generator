// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SongViewModel on _SongViewModelBase, Store {
  late final _$createdSongAtom =
      Atom(name: '_SongViewModelBase.createdSong', context: context);

  @override
  SongModel? get createdSong {
    _$createdSongAtom.reportRead();
    return super.createdSong;
  }

  @override
  set createdSong(SongModel? value) {
    _$createdSongAtom.reportWrite(value, super.createdSong, () {
      super.createdSong = value;
    });
  }

  late final _$rapperImagesAtom =
      Atom(name: '_SongViewModelBase.rapperImages', context: context);

  @override
  List<String> get rapperImages {
    _$rapperImagesAtom.reportRead();
    return super.rapperImages;
  }

  @override
  set rapperImages(List<String> value) {
    _$rapperImagesAtom.reportWrite(value, super.rapperImages, () {
      super.rapperImages = value;
    });
  }

  late final _$fetchSetSongAsyncAction =
      AsyncAction('_SongViewModelBase.fetchSetSong', context: context);

  @override
  Future<void> fetchSetSong(
      String? backingTrack, String? voiceModelUuid, List<String> lyricsData) {
    return _$fetchSetSongAsyncAction.run(
        () => super.fetchSetSong(backingTrack, voiceModelUuid, lyricsData));
  }

  late final _$_SongViewModelBaseActionController =
      ActionController(name: '_SongViewModelBase', context: context);

  @override
  void initService() {
    final _$actionInfo = _$_SongViewModelBaseActionController.startAction(
        name: '_SongViewModelBase.initService');
    try {
      return super.initService();
    } finally {
      _$_SongViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLocal(String songUrl, String title) {
    final _$actionInfo = _$_SongViewModelBaseActionController.startAction(
        name: '_SongViewModelBase.addLocal');
    try {
      return super.addLocal(songUrl, title);
    } finally {
      _$_SongViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
createdSong: ${createdSong},
rapperImages: ${rapperImages}
    ''';
  }
}
