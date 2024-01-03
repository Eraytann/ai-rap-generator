import 'package:flutter/material.dart';
import '../Constants/color_class.dart';

class GradientRadiusButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressedCallback;
  final LinearGradient? gradient;
  final Color? textColor;

  const GradientRadiusButton({
    super.key,
    this.gradient,
    this.textColor,
    required this.label,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
          color: ButtonColorLibrary.defaultButtonColor,
        ),
        child: ElevatedButton(
          onPressed: onPressedCallback,
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(0, 255, 255, 255),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: textColor ?? TextColorLibrary.blackTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
