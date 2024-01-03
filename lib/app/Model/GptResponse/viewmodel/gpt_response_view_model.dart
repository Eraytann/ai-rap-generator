import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/ApiService/gpt_api_service.dart';
import 'package:rap_generator/app/Model/GptResponse/model/model_gpt_response.dart';
part 'gpt_response_view_model.g.dart';

// ignore: library_private_types_in_public_api
class GPTResponseViewModel = _GPTResponseViewModelBase
    with _$GPTResponseViewModel;

abstract class _GPTResponseViewModelBase with Store {
  late final IGptService _service;

  @observable
  GPTMessageResponseModel? chatGptResponse;

  @action
  void initService() {
    _service = GptService();
  }

  @action
  Future<void> fetchGPTResponse(String prompt) async {
    chatGptResponse = await _service.responseRequest(prompt);
  }
}
