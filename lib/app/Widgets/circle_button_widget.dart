import 'package:flutter/material.dart';

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
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: homeButtonCreateButtonColor),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                RapGenerator.iconPlus,
                color: defaultButtonColor,
                size: plusIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
