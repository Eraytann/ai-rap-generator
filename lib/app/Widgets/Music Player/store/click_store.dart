import 'package:mobx/mobx.dart';

part 'click_store.g.dart';

// ignore: library_private_types_in_public_api
class ClickStore = _ClickStore with _$ClickStore;

abstract class _ClickStore with Store {
  @observable
  ObservableList<bool> isButtonClickedList =
      ObservableList.of(List.generate(8, (index) => false));

  @action
  void handleIconTap(int index) {
    for (int i = 0; i < isButtonClickedList.length; i++) {
      if (i == index) {
        isButtonClickedList[i] = !isButtonClickedList[i];
      } else {
        isButtonClickedList[i] = false;
      }
    }
  }
}
