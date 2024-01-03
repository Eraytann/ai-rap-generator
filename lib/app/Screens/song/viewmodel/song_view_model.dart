import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/ApiService/uberduck_api_service.dart';
import '../../../Local/model/data_model.dart';
import '../../../Model/Song/model_song.dart';
part 'song_view_model.g.dart';

// ignore: library_private_types_in_public_api
class SongViewModel = _SongViewModelBase with _$SongViewModel;

abstract class _SongViewModelBase with Store {
  final _savedBox = Hive.box<DataModel>('songs');
  late final IUberduckService _service;

  @observable
  SongModel? createdSong;

  @observable
  List<String> rapperImages = [
    'img_rapper1.png',
    'img_rapper2.png',
    'img_rapper3.png',
    'img_rapper4.png',
    'img_rapper5.png',
    'img_rapper6.png',
    'img_rapper7.png',
    'img_rapper8.png',
    'img_rapper9.png',
    'img_rapper10.png',
  ];

  @action
  void initService() {
    _service = UberduckService();
  }

  @action
  Future<void> fetchSetSong(String? backingTrack, String? voiceModelUuid,
      List<String> lyricsData) async {
    createdSong =
        await _service.responseSong(backingTrack, voiceModelUuid, lyricsData);
  }

  @action
  void addLocal(String songUrl, String title) {
    int randomNumber = Random().nextInt(rapperImages.length - 1) + 1;
    String imageUrl = 'assets/images/rappers/img_rapper$randomNumber.png';

    final song = DataModel(songUrl: songUrl, title: title, imageUrl: imageUrl);
    _savedBox.add(song);
  }
}
