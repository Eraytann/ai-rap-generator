import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rap_generator/app/Exceptions/exceptions.dart';
import 'package:rap_generator/app/Model/Song/model_song.dart';
import '../Model/Uberduck/BackingTracks/model/model_backing_track.dart';
import '../Model/voices_model/voices_model.dart';
import '../Model/voice_model/voice_model.dart';
import 'api_constants.dart';

abstract class IUberduckService {
  Future<List<BackingTrackModel>> responseBeats();
  Future<List<VoiceModel>> fetchVoiceUuids();
  Future<VoiceModel> fetchVoiceDetails(VoicesModel voiceUuidModel);
  Future<SongModel> responseSong(
      String? backingTrack, String? voiceModelUuid, List<String> lyricsData);
}

class UberduckService implements IUberduckService {
  final Dio _networkManager;
  UberduckService()
      : _networkManager = Dio(BaseOptions(baseUrl: ApiUberduck.baseUrl));

  @override
  Future<List<BackingTrackModel>> responseBeats() async {
    String tracksEndPoint = 'reference-audio/backing-tracks?detailed=true';
    String apiKey = ApiUberduck.tracksApiKey;
    try {
      final requestData = {
        'name': 'name',
        'genre': 'genre',
        'bpm': 'bpm',
        'uuid': 'uuid',
        'url': 'url',
      };

      final response = await _networkManager.get(
        tracksEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: requestData,
      );

      if (response.statusCode == HttpStatus.ok) {
        List<BackingTrackModel> backingTracks =
            (response.data['backing_tracks'] as List)
                .map((track) => BackingTrackModel.fromJson(track))
                .toList();

        return backingTracks;
      } else {
        throw ApiException(
            "Request failed. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<List<VoiceModel>> fetchVoiceUuids() async {
    String voiceEndPoint =
        'voices?mode=tts-rap&language=english&is_commercial=true';

    try {
      final response = await _networkManager.get(
        voiceEndPoint,
      );

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> data = response.data;
        final List<VoiceModel> voiceDetailsList = [];

        for (int i = 0; i < 8 && i < data.length; i++) {
          final voiceUuidModel = VoicesModel.fromJson(data[i]);
          final voiceDetails = await fetchVoiceDetails(voiceUuidModel);
          voiceDetailsList.add(voiceDetails);
        }
        return voiceDetailsList;
      } else {
        throw ApiException('Failed to load data');
      }
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<VoiceModel> fetchVoiceDetails(VoicesModel voiceUuidModel) async {
    String voicesEndPoint = 'voices/${voiceUuidModel.voicemodelUuid}/detail';

    try {
      final response = await _networkManager.get(
        voicesEndPoint,
      );

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> data = response.data;

        final VoiceModel voiceDetailsModel = VoiceModel.fromJson(data);
        return voiceDetailsModel;
      } else {
        throw ApiException('Voice Details has not been loaded');
      }
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<SongModel> responseSong(String? backingTrack, String? voiceModelUuid,
      List<String> lyricsData) async {
    String backingTrackEndPoint = 'tts/freestyle';
    String apiKey = ApiUberduck.freeStyleApiKey;

    Map<String, dynamic> postData = {
      "backing_track": backingTrack,
      "lyrics": [lyricsData],
      "voicemodel_uuid": voiceModelUuid
    };

    String jsonString = jsonEncode(postData);

    try {
      final response = await _networkManager.post(
        backingTrackEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Basic $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonString,
      );

      if (response.statusCode == HttpStatus.ok) {
        var jsonResponse = response.data;
        var createdSong = SongModel.fromJson(jsonResponse);
        return createdSong;
      } else {
        throw ApiException(
            'Failed to make the request, ${response.statusCode}');
      }
    } catch (e) {
      throw NetworkException('Failed to make the request $e');
    }
  }
}
