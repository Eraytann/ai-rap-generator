// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rap_generator/app/Screens/prompts_page/viewmodel/store/page_store.dart';
import 'package:rap_generator/app/rap_generator_icons.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/gridview_widget.dart';
import '../../../Widgets/radius_button_widget.dart';
import '../../../Widgets/rich_textfield.dart';
import '../../../constants.dart';
import '../viewmodel/prompt_view_model.dart';

final _viewModel = PromptViewModel();
final _pageStore = PageStore();
final TextEditingController promptController = TextEditingController();

class PromptView extends StatefulWidget {
  const PromptView({super.key});

  @override
  State<PromptView> createState() => _PromptViewState();
}

class _PromptViewState extends State<PromptView> {
  @override
  void initState() {
    super.initState();
    _viewModel.currentText = _viewModel.getLyricByGenre(SongGenre.fun);
    _viewModel.setClickedButtonIndex(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: CustomAppBar(
            isBackOpen: true,
            title: const Text(promptAppBarTitle),
            leadingIcon: IconButton(
              onPressed: closePage,
              icon: const Icon(RapGenerator.iconPrevious),
            ),
            backgroundColor: Color.fromRGBO(250, 250, 250, 250),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 380,
                  height: 190,
                  child: BuildRichTextField(
                    textController: promptController,
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(height: 20.0),
                _buildHorizontalScroll(context),
                const SizedBox(height: 20.0),
                Expanded(
                  child: buildGridView(
                    context,
                    2,
                    10.0,
                    10.0,
                    4,
                    _viewModel.currentText,
                    gridOnChanged,
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  void gridOnChanged(String selectedLabel) {
    _viewModel.onLabelSelected(selectedLabel);
    promptController.text = _viewModel.newTextFieldValue;
  }

  onChanged(newText) {
    _viewModel.onTextChanged(newText);
  }

  void closePage() {
    _pageStore.finalFunc();
    Navigation.ofPop();
  }
}

Widget _buildHorizontalScroll(BuildContext context) {
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
                _viewModel.updateGrid(
                  _viewModel.getLyricByGenre(SongGenre.fun),
                );
                _viewModel.setClickedButtonIndex(0);
              },
            ),
            GradientRadiusButton(
              label: songGenreHappy,
              textColor: textColorControl(1),
              gradient: buttonColorControl(1),
              onPressedCallback: () {
                _viewModel.updateGrid(
                  _viewModel.getLyricByGenre(SongGenre.happy),
                );
                _viewModel.setClickedButtonIndex(1);
              },
            ),
            GradientRadiusButton(
              label: songGenreLove,
              textColor: textColorControl(2),
              gradient: buttonColorControl(2),
              onPressedCallback: () {
                _viewModel.updateGrid(
                  _viewModel.getLyricByGenre(SongGenre.love),
                );
                _viewModel.setClickedButtonIndex(2);
              },
            ),
            GradientRadiusButton(
              label: songGenreSad,
              textColor: textColorControl(3),
              gradient: buttonColorControl(3),
              onPressedCallback: () {
                _viewModel.updateGrid(
                  _viewModel.getLyricByGenre(SongGenre.sad),
                );
                _viewModel.setClickedButtonIndex(3);
              },
            ),
            GradientRadiusButton(
              label: songGenreSexy,
              textColor: textColorControl(4),
              gradient: buttonColorControl(4),
              onPressedCallback: () {
                _viewModel.updateGrid(
                  _viewModel.getLyricByGenre(SongGenre.sexy),
                );
                _viewModel.setClickedButtonIndex(4);
              },
            ),
          ],
        ),
      );
    },
  );
}

LinearGradient? firstOpenedGradient() {
  return _viewModel.currentText == _viewModel.getLyricByGenre(SongGenre.fun)
      ? gradientButtonColor
      : null;
}

Color firstOpenedTextColor() {
  return _viewModel.currentText == _viewModel.getLyricByGenre(SongGenre.fun)
      ? whiteTextColor
      : blackTextColor;
}

LinearGradient? buttonColorControl(int index) =>
    _viewModel.clickedButtonIndex == index ? gradientButtonColor : null;

Color textColorControl(int index) {
  return _viewModel.clickedButtonIndex == index
      ? whiteTextColor
      : blackTextColor;
}
