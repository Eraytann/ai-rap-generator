import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../viewmodel/settings_view_model.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToPage,
      child: Stack(
        children: [
          Image.asset(premiumBgImg1),
          Image.asset(premiumBgImg2),
          Positioned.fill(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      elevatedButtonPremium,
                      style: TextStyle(
                        color: whiteTextColor,
                        fontSize: elevatedBtnFontSize,
                      ),
                    ),
                    Image.asset(premiumBgImg3)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
