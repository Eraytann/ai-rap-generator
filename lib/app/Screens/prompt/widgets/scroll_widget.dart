// horizontal_scroll_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../Constants/color_class.dart';
import '../../../Widgets/radius_button_widget.dart';
import '../../../constants.dart';
import '../viewmodel/prompt_view_model.dart';

final _viewModel = PromptViewModel();

class HorizontalScrollWidget extends StatelessWidget {
  final int clickedButtonIndex;
  final String currentText;
  final Function(int) onPressedCallback;

  const HorizontalScrollWidget({
    super.key,
    required this.clickedButtonIndex,
    required this.currentText,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GradientRadiusButton(
                label: songGenreFun,
                textColor: firstOpenedTextColor(),
                gradient: firstOpenedGradient(),
                onPressedCallback: () {
                  onPressedCallback(0);
                },
              ),
              GradientRadiusButton(
                label: songGenreHappy,
                textColor: textColorControl(1),
                gradient: buttonColorControl(1),
                onPressedCallback: () {
                  onPressedCallback(1);
                },
              ),
              GradientRadiusButton(
                label: songGenreLove,
                textColor: textColorControl(2),
                gradient: buttonColorControl(2),
                onPressedCallback: () {
                  onPressedCallback(2);
                },
              ),
              GradientRadiusButton(
                label: songGenreSad,
                textColor: textColorControl(3),
                gradient: buttonColorControl(3),
                onPressedCallback: () {
                  onPressedCallback(3);
                },
              ),
              GradientRadiusButton(
                label: songGenreSexy,
                textColor: textColorControl(4),
                gradient: buttonColorControl(4),
                onPressedCallback: () {
                  onPressedCallback(4);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  LinearGradient? firstOpenedGradient() {
    return currentText == _viewModel.getLyricByGenre(SongGenre.fun)
        ? ButtonColorLibrary.gradientButtonColor
        : null;
  }

  Color firstOpenedTextColor() {
    return currentText == _viewModel.getLyricByGenre(SongGenre.fun)
        ? TextColorLibrary.whiteTextColor
        : TextColorLibrary.blackTextColor;
  }

  LinearGradient? buttonColorControl(int index) => clickedButtonIndex == index
      ? ButtonColorLibrary.gradientButtonColor
      : null;

  Color textColorControl(int index) {
    return clickedButtonIndex == index
        ? TextColorLibrary.whiteTextColor
        : TextColorLibrary.blackTextColor;
  }
}
