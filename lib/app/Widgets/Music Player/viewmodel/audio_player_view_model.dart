// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

part 'audio_player_view_model.g.dart';

// ignore: library_private_types_in_public_api
class AudioPlayerViewModel = _AudioPlayerViewModelBase
    with _$AudioPlayerViewModel;

abstract class _AudioPlayerViewModelBase with Store {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @observable
  Duration position = Duration.zero;

  @observable
  Duration duration = Duration.zero;

  @observable
  bool isAudioPlaying = false;

  @observable
  bool isPaused = true;

  @action
  Future<void> playAudio(String url) async {
    await _audioPlayer.play(UrlSource(url));
    isAudioPlaying = true;
  }

  @action
  void audioSeek(Duration position) {
    _audioPlayer.seek(position);
  }

  @action
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    isAudioPlaying = false;
  }

  @action
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    isAudioPlaying = false;
    isPaused = true;
  }

  @action
  Future<void> resumeAudio() async {
    await _audioPlayer.resume();
    isPaused = false;
  }

  @action
  void dispose() {
    _audioPlayer.dispose();
    _audioPlayer.stop();
  }
}
