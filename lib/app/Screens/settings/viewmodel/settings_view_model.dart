import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Features/premium_check/premium_check.dart';
import '../../../Navigation/navigator.dart';
import '../../../constants.dart';
import '../../onboarding_premium/onboarding_premium_view.dart';
import '../view/webview/webview.dart';
import '../widgets/list_tile.dart';
import '../widgets/premium_button.dart';

void navigateToWebview() {
  Navigation.push(
    page: const WebviewPage(),
  );
}

void navigateToPage() {
  Navigation.push(
    page: const OnboardingPremiumView(),
  );
}

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CounterStore _counterStore = GetIt.I.get<CounterStore>();

    return Observer(
      builder: (_) {
        return Column(
          children: [
            Visibility(
              visible: _counterStore.counter == -1 ? false : true,
              child: const Column(
                  children: [PremiumButton(), SizedBox(height: 20)]),
            ),
            const CustomListTile(
              text: termsLabel,
              onPressed: navigateToWebview,
            ),
            const SizedBox(height: 20),
            const CustomListTile(
              text: elevatedButtonContact,
              onPressed: navigateToWebview,
            ),
            const SizedBox(height: 20),
            const CustomListTile(
              text: privacyLabel,
              onPressed: navigateToWebview,
            ),
            const SizedBox(height: 20),
            const CustomListTile(
              text: restoreLabel,
              onPressed: navigateToWebview,
            ),
            const SizedBox(height: 20),
            const CustomListTile(
              text: elevatedButtonHelp,
              onPressed: navigateToWebview,
            ),
          ],
        );
      },
    );
  }
}
