import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'premium_check.g.dart';

// ignore: library_private_types_in_public_api
class CounterStore = _CounterStoreBase with _$CounterStore;

abstract class _CounterStoreBase with Store {
  @observable
  bool navigate = false;

  @observable
  int counter = 3;

  @action
  Future<bool> decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter') ?? 3;
    navigate = false;

    if (counter >= 0) {
      if (counter == 0) {
        navigate = true;
        return navigate;
      } else {
        counter--;
        await saveCounterToSharedPreferences();
        return navigate;
      }
    } else {
      await saveCounterToSharedPreferences();
      return false;
    }
  }

  @action
  Future<void> saveCounterToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
  }
}
