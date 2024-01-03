// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rap_generator/app/Screens/prompts_page/viewmodel/store/page_store.dart';
import 'package:rap_generator/app/rap_generator_icons.dart';
import '../../../Constants/padding_class.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/gridview_widget.dart';
import '../../../Widgets/rich_textfield.dart';
import '../../../Constants/text_class.dart';
import '../viewmodel/prompt_view_model.dart';
import '../widgets/scroll_widget.dart';

final _viewModel = PromptViewModel();
final _pageStore = PageStore();
final TextEditingController promptController = TextEditingController();

class PromptView extends StatefulWidget {
  const PromptView({super.key});

  @override
  State<PromptView> createState() => _PromptViewState();
}

class _PromptViewState extends State<PromptView> {
  void closePage() {
    _pageStore.finalFunc();
    Navigation.ofPop();
  }

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
            padding: PaddingSizing.midEdgeAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: defaultMediaQueryWidth(context),
                  height: minMediaQuery(context),
                  child: BuildRichTextField(
                    textController: promptController,
                    onChanged: (newText) => _viewModel.onChanged(newText),
                  ),
                ),
                SizedBox(height: SizedBoxSpacing.midHeight),
                HorizontalScrollWidget(
                  clickedButtonIndex: _viewModel.clickedButtonIndex,
                  currentText: _viewModel.currentText,
                  onPressedCallback: (index) =>
                      _viewModel.buttonOnPressed(index),
                ),
                const SizedBox(height: SizedBoxSpacing.midHeight),
                Observer(builder: (_) {
                  return Expanded(
                    child: buildGridView(
                      context,
                      GridProperties.minCrossItemCount,
                      GridSpace.smallSpace,
                      GridSpace.smallSpace,
                      GridProperties.minItemCount,
                      _viewModel.currentText,
                      gridOnChanged,
                    ),
                  );
                }),
                const SizedBox(height: SizedBoxSpacing.smallHeight),
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
}
