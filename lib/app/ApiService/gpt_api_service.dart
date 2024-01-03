import 'package:dio/dio.dart';
import '../Model/GptResponse/model/model_gpt_response.dart';
import '../constants.dart';
import 'api_constants.dart';

abstract class IGptService {
  Future<GPTMessageResponseModel> responseRequest(String prompt);
}

class GptService implements IGptService {
  final Dio _networkManager;
  GptService()
      : _networkManager = Dio(BaseOptions(baseUrl: ApiChatGpt.baseUrl));

  @override
  Future<GPTMessageResponseModel> responseRequest(String prompt) async {
    String endPoint = 'v1/chat/completions';
    String apiKey = ApiChatGpt.apiKey;

    final requestData = {
      'model': 'gpt-3.5-turbo-0613',
      "messages": [
        {"role": "user", "content": command + prompt}
      ],
      "max_tokens": 250
    };
    try {
      final response = await _networkManager.post(
        endPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
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
}
