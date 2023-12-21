import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 4,
      effect: const SwapEffect(
        activeDotColor: Color(0xFFE54157),
        dotHeight: 5,
        dotWidth: 30,
        dotColor: Color.fromARGB(255, 85, 85, 85),
      ),
    );
  }
}
