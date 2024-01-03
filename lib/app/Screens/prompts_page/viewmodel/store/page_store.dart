import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/Screens/beats/viewmodel/beats_view_model.dart';
import 'package:rap_generator/app/Screens/prompt/view/prompt_view.dart';
import 'package:rap_generator/app/Screens/rapper/viewmodel/rapper_view_model.dart';
import '../../../../Constants/color_class.dart';
import '../../../../constants.dart';

part 'page_store.g.dart';

// ignore: library_private_types_in_public_api
class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase with Store {
  final _beatsViewModel = BeatsViewModel();
  final _rapperViewModel = RapperViewModel();

  @observable
  LinearGradient? currentGradient;

  @observable
  int currentPage = 1;

  @observable
  List<String> parsedText = [];

  @action
  void setCurrentPage(int value) {
    currentPage = value;
  }

  @action
  void parseText(String text) {
    List<String> lines = text.split('\n');
    List<List<String>> parsedTextResult = [];

    for (String line in lines) {
      List<String> words = line.split(' ');
      parsedTextResult.add(words);
    }

    parsedText =
        parsedTextResult.map((lineWords) => lineWords.join(' ')).toList();
  }

  @action
  void changeButtonColor() {
    currentGradient = ButtonColorLibrary.gradientButtonColor;
  }

  @action
  void finalFunc() {
    promptController.text = "";
    _beatsViewModel.selectedTrackUUID = null;
    _beatsViewModel.selectedBeatIndex = -1;
    _rapperViewModel.selectedVoiceModelUUID = null;
  }
}
