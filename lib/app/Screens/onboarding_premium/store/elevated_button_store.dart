import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'elevated_button_store.g.dart';

// ignore: library_private_types_in_public_api
class ElevatedButtonStore = _ElevatedButtonStore with _$ElevatedButtonStore;

abstract class _ElevatedButtonStore with Store {
  @observable
  int clickedButtonIndex = -1;

  @action
  void setClickedButtonIndex(int index) {
    clickedButtonIndex = index;
  }

  @observable
  int counter = -1;

  @action
  Future<void> saveCounterToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
  }
}
