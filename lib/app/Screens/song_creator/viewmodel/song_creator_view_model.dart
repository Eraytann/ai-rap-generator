import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/Local/model/data_model.dart';
import 'package:rap_generator/app/constants.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Navigation/navigator.dart';
part 'song_creator_view_model.g.dart';

// ignore: library_private_types_in_public_api
class SongCreatorViewModel = _SongCreatorViewModel with _$SongCreatorViewModel;

abstract class _SongCreatorViewModel with Store {
  final _audioPlayer = AudioPlayer();
  final _savedBox = Hive.box<DataModel>('songs');

  @observable
  bool isPlaying = false;

  @observable
  ObservableList<bool> isButtonClickedList =
      ObservableList.of(List.generate(8, (index) => false));

  @observable
  DataModel? dataModel;

  @observable
  @action
  void closePage() {
    Navigation.ofPop();
  }

  @action
  void stopAudio() {
    _audioPlayer.stop();
    isPlaying = false;
  }

  @action
  void handleIconTap(int index) {
    for (int i = 0; i < isButtonClickedList.length; i++) {
      if (i == index) {
        isButtonClickedList[i] = !isButtonClickedList[i];
      } else {
        isButtonClickedList[i] = false;
      }
    }
  }

  @action
  void handlePlayButton(int index, String url) {
    handleIconTap(index);
    if (isPlaying) {
      _audioPlayer.stop();
      isPlaying = false;
    } else {
      _audioPlayer.play(UrlSource(url));
      isPlaying = true;
    }
  }

  @action
  void sharePressed() {
    Share.share(shareMessage);
  }

  @action
  void deleteSong(int index) {
    _savedBox.deleteAt(index);
  }

  @action
  void updateTitle(
    TextEditingController controller,
    int index,
  ) {
    final song = _savedBox.getAt(index);
    final value = DataModel(
        songUrl: song!.songUrl,
        title: controller.text,
        imageUrl: song.imageUrl);
    _savedBox.putAt(index, value);
  }
}
