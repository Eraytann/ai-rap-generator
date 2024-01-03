import 'package:flutter/material.dart';

import '../Constants/color_class.dart';
import '../Constants/custom_font_class.dart';
import '../constants.dart';
import '../rap_generator_icons.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ButtonColorLibrary.homeButtonCreateButtonColor),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                RapGenerator.iconPlus,
                color: ButtonColorLibrary.defaultButtonColor,
                size: CustomFontSizes.plusIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
