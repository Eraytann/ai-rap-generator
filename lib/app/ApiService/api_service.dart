import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rap_generator/app/Model/Song/model_song.dart';
import '../Model/GptResponse/model/model_gpt_response.dart';
import '../Model/Uberduck/BackingTracks/model/model_backing_track.dart';
import '../Model/voices_model/voices_model.dart';
import '../Model/voice_model/voice_model.dart';
import '../constants.dart';
import 'api_constants.dart';

class ApiService {
  final dio = Dio();

  Future<GPTMessageResponseModel> responseRequest(String prompt) async {
    String url = ApiChatGpt.baseUrl;

    final requestData = {
      'model': 'gpt-3.5-turbo-0613',
      "messages": [
        {"role": "user", "content": command + prompt}
      ],
      "max_tokens": 250
    };
    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiChatGpt.apiKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: requestData,
      );

      var jsonResponse = response.data;
      var chatGptResponse = GPTMessageResponseModel.fromJson(jsonResponse);
      return chatGptResponse;
    } catch (e) {
      return GPTMessageResponseModel(message: 'Error $e');
    }
  }

  Future<List<BackingTrackModel>> responseBeats() async {
    const String url = ApiUberduck.baseUrl;

    try {
      final requestData = {
        'name': 'name',
        'genre': 'genre',
        'bpm': 'bpm',
        'uuid': 'uuid',
        'url': 'url',
      };

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiUberduck.apiKey}',
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: requestData,
      );

      if (response.statusCode == 200) {
        List<BackingTrackModel> backingTracks =
            (response.data['backing_tracks'] as List)
                .map((track) => BackingTrackModel.fromJson(track))
                .toList();

        return backingTracks;
      } else {
        throw Exception("Request failed. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<VoiceModel>> fetchVoiceUuids() async {
    try {
      final response = await dio.get(
        'https://api.uberduck.ai/voices?mode=tts-rap&language=english&is_commercial=true',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<VoiceModel> voiceDetailsList = [];

        for (int i = 0; i < 8 && i < data.length; i++) {
          final voiceUuidModel = VoicesModel.fromJson(data[i]);
          final voiceDetails = await fetchVoiceDetails(voiceUuidModel);
          voiceDetailsList.add(voiceDetails);
        }
        return voiceDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<VoiceModel> fetchVoiceDetails(VoicesModel voiceUuidModel) async {
    try {
      final response = await dio.get(
        'https://api.uberduck.ai/voices/${voiceUuidModel.voicemodelUuid}/detail',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        final VoiceModel voiceDetailsModel = VoiceModel.fromJson(data);
        return voiceDetailsModel;
      } else {
        throw Exception('Voice details has not been loaded!');
      }
    } catch (e) {
      throw Exception('Hata: $e');
    }
  }

  Future<SongModel> responseSong(String? backingTrack, String? voiceModelUuid,
      List<String> lyricsData) async {
    String url = ApiUberduck.freeStyleUrl;
    String apiKey = ApiUberduck.freeStyleApiKey;

    Map<String, dynamic> postData = {
      "backing_track": backingTrack,
      "lyrics": [lyricsData],
      "voicemodel_uuid": voiceModelUuid
    };

    String jsonString = jsonEncode(postData);

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Basic $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonString,
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var createdSong = SongModel.fromJson(jsonResponse);
        return createdSong;
      } else {
        throw Exception('Failed to make the request, ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the request $e');
    }
  }
}

/*

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var createdSong = SongModel.fromJson(jsonResponse);
        return createdSong;
      } else {
        throw Exception('Failed to make the request, ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the request $e');
    }
  }
*/