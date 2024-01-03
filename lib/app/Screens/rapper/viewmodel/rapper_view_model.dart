import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/ApiService/uberduck_api_service.dart';
import '../../../Model/voice_model/voice_model.dart';

part 'rapper_view_model.g.dart';

// ignore: library_private_types_in_public_api
class RapperViewModel = _RapperViewModelBase with _$RapperViewModel;

abstract class _RapperViewModelBase with Store {
  late final IUberduckService _service;

  @observable
  List<VoiceModel>? voiceDetailsList;

  @observable
  String? selectedVoiceModelUUID;

  @action
  void initService() {
    _service = UberduckService();
  }

  @action
  Future<void> fetchVoiceUuids() async {
    voiceDetailsList = await _service.fetchVoiceUuids();
  }

  @action
  void setSelectedVoiceUUID(String? uuid) {
    selectedVoiceModelUUID = uuid;
  }
}
