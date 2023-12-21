import 'package:mobx/mobx.dart';

import '../../../Model/GptResponse/viewmodel/gpt_response_view_model.dart';

part 'onboarding_view_model.g.dart';

// ignore: library_private_types_in_public_api
class OnboardingViewModel = _OnboardingViewModelBase with _$OnboardingViewModel;

abstract class _OnboardingViewModelBase with Store {
  @observable
  GPTResponseViewModel gptResponseStore = GPTResponseViewModel();

  @observable
  int currentPage = 0;

  @action
  void setCurrentPage(int page) {
    currentPage = page;
  }
}
