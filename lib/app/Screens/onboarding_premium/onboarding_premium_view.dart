import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rap_generator/app/Constants/color_class.dart';
import 'package:rap_generator/app/Constants/padding_class.dart';
import 'package:rap_generator/app/Navigation/navigator.dart';
import 'package:rap_generator/app/Screens/home/view/home_view.dart';
import 'package:rap_generator/app/Screens/onboarding_premium/store/elevated_button_store.dart';
import 'package:rap_generator/app/Screens/settings/viewmodel/settings_view_model.dart';
import 'package:rap_generator/app/Widgets/app_bar_widget.dart';
import 'package:rap_generator/app/Widgets/elevated_button_widget.dart';
import 'package:rap_generator/app/Constants/text_class.dart';
import 'package:rap_generator/app/rap_generator_icons.dart';

bool isClicked = false;

class OnboardingPremiumView extends StatefulWidget {
  const OnboardingPremiumView({super.key});

  @override
  State<OnboardingPremiumView> createState() => _OnboardingPremiumViewState();
}

class _OnboardingPremiumViewState extends State<OnboardingPremiumView> {
  final ElevatedButtonStore _buttonStore = ElevatedButtonStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
          isBackOpen: false,
          actions: IconButton(
            onPressed: () {
              Navigation.push(page: const HomeView());
            },
            icon: const Icon(RapGenerator.iconCross),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    onPreBg,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    onPreHeader,
                  ),
                ],
              ),
            ),
            const Text(
              inAppPage2Headline,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: SizedBoxSpacing.midHeight,
            ),
            Image.asset(onPreAds),
            const SizedBox(
              height: SizedBoxSpacing.bigHeight,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButtonWidget(
                    roundedRectBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      _buttonStore.setClickedButtonIndex(0);
                    },
                    color: ButtonColorLibrary.defaultButtonColor,
                    text: weeklyText,
                    rText: priceLabel,
                    textColor: textColorControl(0),
                    gradient: buttonColorControl(0)),
                const SizedBox(
                  height: SizedBoxSpacing.smallHeight,
                ),
                ElevatedButtonWidget(
                    roundedRectBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      _buttonStore.setClickedButtonIndex(1);
                    },
                    color: ButtonColorLibrary.defaultButtonColor,
                    text: monthlyText,
                    rText: priceLabel,
                    textColor: textColorControl(1),
                    gradient: buttonColorControl(1)),
                const SizedBox(
                  height: SizedBoxSpacing.smallHeight,
                ),
                ElevatedButtonWidget(
                  roundedRectBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    _buttonStore.setClickedButtonIndex(2);
                  },
                  color: ButtonColorLibrary.defaultButtonColor,
                  text: annualText,
                  rText: priceLabel,
                  textColor: textColorControl(2),
                  gradient: buttonColorControl(2),
                ),
                const SizedBox(
                  height: SizedBoxSpacing.smallHeight,
                ),
                ElevatedButtonWidget(
                  onPressed: () async {
                    _buttonStore.saveCounterToSharedPreferences();
                    Navigation.pushReplace(
                      page: const HomeView(),
                    );
                  },
                  color: TextColorLibrary.blackTextColor,
                  text: elevatedButtonContinue,
                ),
                const SizedBox(
                  height: SizedBoxSpacing.smallHeight,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton(
                      text: termsLabel,
                    ),
                    SmallButton(
                      text: restoreLabel,
                    ),
                    SmallButton(
                      text: privacyLabel,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }

  LinearGradient? buttonColorControl(int index) {
    return _buttonStore.clickedButtonIndex == index
        ? ButtonColorLibrary.gradientButtonColor
        : null;
  }

  Color textColorControl(int index) {
    return _buttonStore.clickedButtonIndex == index
        ? TextColorLibrary.whiteTextColor
        : TextColorLibrary.blackTextColor;
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        navigateToWebview();
      },
      child: Text(
        text,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 12,
          color: TextColorLibrary.blackTextColor,
        ),
      ),
    );
  }
}
