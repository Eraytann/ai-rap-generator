import 'package:flutter/material.dart';
import '../constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final LinearGradient? gradient;
  final String text;
  final String? rText;
  final Color? textColor;
  final RoundedRectangleBorder? roundedRectBorder; // Yeni eklenen parametre

  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.color,
    this.gradient,
    required this.text,
    this.rText,
    this.textColor,
    this.roundedRectBorder,
  });

  @override
  Widget build(BuildContext context) {
    final shape = roundedRectBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        );
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.zero,
        backgroundColor: color,
        shape: shape,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: shape.borderRadius,
        ),
        child: Container(
          width: 300,
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: elevatedBtnFontSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
              if (rText != null)
                Text(
                  rText!,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: elevatedBtnFontSize,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
