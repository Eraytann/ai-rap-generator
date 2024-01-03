import 'package:flutter/material.dart';

class PaddingSizing {
  static const smallVertical = EdgeInsets.symmetric(vertical: 10);
  static const midVertical = EdgeInsets.symmetric(vertical: 20);
  static const bigVertical = EdgeInsets.symmetric(vertical: 30);

  static const smallHorizontal = EdgeInsets.symmetric(horizontal: 10);
  static const midHorizontal = EdgeInsets.symmetric(horizontal: 20);
  static const bigHorizontal = EdgeInsets.symmetric(horizontal: 30);
  static const customHorizontal = EdgeInsets.symmetric(horizontal: 120);
  static const customHorizantalMid = EdgeInsets.symmetric(horizontal: 40);

  static const smallEdgeAll = EdgeInsets.all(10);
  static const midEdgeAll = EdgeInsets.all(20);
  static const bigEdgeAll = EdgeInsets.all(30);

  static const smallEdgeInsetsOnlyR = EdgeInsets.only(right: 10.0);
  static const smallEdgeInsetsOnlyL = EdgeInsets.only(left: 15);
}

class GridSpace {
  static const double smallSpace = 10.0;
  static const double midSpace = 20.0;
  static const double bigSpace = 30.0;
}

class GridProperties {
  static const int minItemCount = 4;
  static const int minCrossItemCount = 2;
}

class SizedBoxSpacing {
  static const smallHeight = 10.0;
  static const midHeight = 20.0;
  static const bigHeight = 30.0;
  static const maxHeight = 40.0;
}

double defaultMediaQueryWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double defaultMediaQueryHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double minMediaQuery(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.2;
