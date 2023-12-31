import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/ApiService/uberduck_api_service.dart';
import 'package:rap_generator/app/Widgets/Music%20Player/viewmodel/audio_player_view_model.dart';
import '../../../Model/Uberduck/BackingTracks/model/model_backing_track.dart';
part 'beats_view_model.g.dart';

// ignore: library_private_types_in_public_api
class BeatsViewModel = _BeatsViewModelBase with _$BeatsViewModel;

abstract class _BeatsViewModelBase with Store {
  late final IUberduckService _service;
  final AudioPlayerViewModel audioPlayerViewModel = AudioPlayerViewModel();

  @observable
  int selectedBeatIndex = -1;

  @observable
  BeatsViewModel? beat;

  @observable
  List<BackingTrackModel> beats = [];

  @observable
  String? selectedTrackUUID;

  @action
  void setSelectedTrackUUID(String? uuid) {
    selectedTrackUUID = uuid;
  }

  @action
  void initService() {
    _service = UberduckService();
  }

  @action
  Future<List<BackingTrackModel>> fetchBeats() async {
    try {
      beats = await _service.responseBeats();
      return beats;
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  void onClickControl(BackingTrackModel track, int index) {
    if (!audioPlayerViewModel.isAudioPlaying ||
        selectedTrackUUID != track.uuid) {
      audioPlayerViewModel.playAudio(track.url);
      selectedTrackUUID = track.uuid;
    } else {
      audioPlayerViewModel.stopAudio();
      selectedTrackUUID = null;
    }
  }
}
