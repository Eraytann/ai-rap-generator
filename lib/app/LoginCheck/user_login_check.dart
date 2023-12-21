import 'package:shared_preferences/shared_preferences.dart';

import '../Navigation/navigator.dart';
import '../Screens/home/view/home_view.dart';
import '../Screens/onboarding/view/onboarding_view.dart';

checkIfUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  isLoggedIn
      ? Navigation.push(page: const HomeView())
      : Navigation.push(page: const OnboardingPage());
}
