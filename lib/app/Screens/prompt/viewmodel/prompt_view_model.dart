import 'package:mobx/mobx.dart';
import '../../../constants.dart';
part 'prompt_view_model.g.dart';

// ignore: library_private_types_in_public_api
class PromptViewModel = _PromptViewModelBase with _$PromptViewModel;

final List<Map<SongGenre, String>> lyrics = [
  {SongGenre.fun: songGenreFunPoem},
  {SongGenre.happy: songGenreHappyPoem},
  {SongGenre.love: songGenreLovePoem},
  {SongGenre.sad: songGenreSadPoem},
  {SongGenre.sexy: songGenreSexyPoem}
];

enum SongGenre {
  fun,
  happy,
  love,
  sad,
  sexy,
}

abstract class _PromptViewModelBase with Store {
  @observable
  String currentText = "";

  @observable
  String newTextFieldValue = "";

  @observable
  int clickedButtonIndex = -1;

  @observable
  String newText = "";

  @observable
  int? index;

  @action
  void updateGrid(String text) {
    currentText = text;
  }

  @action
  void onTextChanged(String textFieldValue) {
    updateGrid(textFieldValue);
  }

  @action
  void onLabelSelected(String label) {
    newTextFieldValue = label;
  }

  @action
  String getLyricByGenre(SongGenre genre) {
    for (var item in lyrics) {
      if (item.containsKey(genre)) {
        return item[genre]!;
      }
    }
    return '';
  }

  @action
  void setClickedButtonIndex(index) {
    clickedButtonIndex = index;
  }

  @action
  void onChanged(String newText) {
    onTextChanged(newText);
  }

  @action
  void buttonOnPressed(index) {
    updateGrid(getLyricByGenre(SongGenre.values[index]));
    setClickedButtonIndex(index);
  }
}
