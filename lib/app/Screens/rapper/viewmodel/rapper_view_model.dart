import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import '../../../ApiService/api_service.dart';
import '../../../Model/voice_model/voice_model.dart';
import '../../../Model/voices_model/voices_model.dart';

part 'rapper_view_model.g.dart';

// ignore: library_private_types_in_public_api
class RapperViewModel = _RapperViewModelBase with _$RapperViewModel;

abstract class _RapperViewModelBase with Store {
  final ApiService _apiService = ApiService();
  final Dio _dio = Dio();

  @observable
  ObservableList<VoiceModel> voiceList = ObservableList<VoiceModel>();

  @observable
  String? selectedVoiceModelUUID;

  @action
  Future<void> fetchVoiceUuids() async {
    try {
      final response = await _dio.get(
        'https://api.uberduck.ai/voices?mode=tts-rap&language=english&is_commercial=true',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<VoiceModel> voiceDetailsList = [];

        for (int i = 0; i < 8 && i < data.length; i++) {
          final voiceUuidModel = VoicesModel.fromJson(data[i]);
          final voiceDetails =
              await _apiService.fetchVoiceDetails(voiceUuidModel);
          voiceDetailsList.add(voiceDetails);
        }
        voiceList = ObservableList.of(voiceDetailsList);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @action
  Future<VoiceModel> fetchVoiceDetails(VoicesModel voiceUuidModel) async {
    try {
      final response = await _dio.get(
        'https://api.uberduck.ai/voices/${voiceUuidModel.voicemodelUuid}/detail',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final VoiceModel voiceDetailsModel = VoiceModel.fromJson(data);

        return voiceDetailsModel;
      } else {
        throw Exception('Ses detayları yüklenemedi');
      }
    } catch (e) {
      throw Exception('Hata: $e');
    }
  }

  @action
  void setSelectedVoiceUUID(String? uuid) {
    selectedVoiceModelUUID = uuid;
  }
}
