import 'package:flutter/material.dart';

class BottomOverlayWidget extends StatelessWidget {
  const BottomOverlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      bottom: 10,
      child: Center(
        child: Transform.translate(
          offset: const Offset(0.0, 725.0),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(238, 255, 255, 255),
                  spreadRadius: 20.0,
                  blurRadius: 75.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
