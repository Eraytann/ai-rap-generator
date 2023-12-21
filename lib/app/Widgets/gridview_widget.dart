import 'package:flutter/material.dart';

import '../constants.dart';

Widget buildGridView(
  BuildContext context,
  int crossAxisCount,
  double crossAxisSpacing,
  double mainAxisSpacing,
  int itemCount,
  String text,
  void Function(String) onTap,
) {
  return GestureDetector(
    onTap: () => onTap(text),
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: gridBackgroundColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                substringText(text),
                style: const TextStyle(
                  color: gridTextColor,
                  fontSize: gridTextFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    ),
  );
}

String substringText(String text) =>
    (text.length > 15) ? '${text.substring(0, text.length)}...' : text;
