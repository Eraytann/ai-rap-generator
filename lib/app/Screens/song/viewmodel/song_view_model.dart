import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../../ApiService/api_service.dart';
import '../../../Local/model/data_model.dart';
import '../../../Model/Song/model_song.dart';
part 'song_view_model.g.dart';

// ignore: library_private_types_in_public_api
class SongViewModel = _SongViewModelBase with _$SongViewModel;

abstract class _SongViewModelBase with Store {
  final ApiService _apiService = ApiService();
  final _savedBox = Hive.box<DataModel>('songs');

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

  @observable
  SongModel? createdSong;

  @action
  Future<void> fetchAndSetSong(String? backingTrack, String? voiceModelUuid,
      List<String> lyricsData) async {
    try {
      createdSong = await _apiService.responseSong(
          backingTrack, voiceModelUuid, lyricsData);
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  void addLocal(String songUrl, String title) {
    int randomNumber = Random().nextInt(rapperImages.length - 1) + 1;
    String imageUrl = 'assets/images/rappers/img_rapper$randomNumber.png';

    final song = DataModel(songUrl: songUrl, title: title, imageUrl: imageUrl);
    _savedBox.add(song);
  }
}
