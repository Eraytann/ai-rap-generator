import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/Model/GptResponse/model/model_gpt_response.dart';
import '../../../ApiService/api_service.dart';
part 'gpt_response_view_model.g.dart';

// ignore: library_private_types_in_public_api
class GPTResponseViewModel = _GPTResponseViewModelBase
    with _$GPTResponseViewModel;

abstract class _GPTResponseViewModelBase with Store {
  final ApiService _apiService = ApiService();

  @observable
  GPTMessageResponseModel? chatGptResponse;

  @action
  Future<void> fetchGPTResponse(String prompt) async {
    try {
      chatGptResponse = await _apiService.responseRequest(prompt);
    } catch (e) {
      throw Exception(e);
    }
  }
}
