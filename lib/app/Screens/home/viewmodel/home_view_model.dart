import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:rap_generator/app/Screens/onboarding_premium/onboarding_premium_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Features/premium_check/premium_check.dart';
import '../../../Navigation/navigator.dart';
import '../../prompts_page/view/prompts_page_view.dart';
import '../../settings/view/settings_view.dart';
part 'home_view_model.g.dart';

// ignore: library_private_types_in_public_api
class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final CounterStore _counterStore = GetIt.I.get<CounterStore>();

  void appbarNavigateToPage() {
    Navigation.push(
      page: const SettingsView(),
    );
  }

  void navigateToPage() {
    Navigation.push(
      page: const PromtsPage(),
    );
  }

  @action
  Future<void> loadCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterStore.counter = prefs.getInt('counter') ?? 3;
  }

  @action
  Future<void> preCheck() async {
    if (await counterStore.decrementCounter()) {
      Navigation.push(page: const OnboardingPremiumView());
    } else {
      Navigation.push(page: const PromtsPage());
    }
  }
}
