import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Constants/color_class.dart';
import 'package:rap_generator/app/Constants/padding_class.dart';
import '../../../Model/GptResponse/viewmodel/gpt_response_view_model.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/rich_textfield.dart';
import '../../../Constants/text_class.dart';
import '../../../rap_generator_icons.dart';

class GeneratedLyricsView extends StatefulWidget {
  const GeneratedLyricsView({super.key});

  @override
  State<GeneratedLyricsView> createState() => _GeneratedLyricsViewState();
}

class _GeneratedLyricsViewState extends State<GeneratedLyricsView> {
  final TextEditingController _textEditingController = TextEditingController();
  final GPTResponseViewModel viewModel = GetIt.I.get<GPTResponseViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getCurrentText();

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(generatingAppBarTitle),
        actions: const Icon(RapGenerator.iconRefresh),
        isBackOpen: true,
        leadingIcon: IconButton(
          onPressed: closeThePage,
          icon: const Icon(RapGenerator.iconPrevious),
        ),
      ),
      body: Padding(
        padding: PaddingSizing.smallEdgeAll,
        child: Observer(builder: (_) {
          return GeneratedLyrics(
            textEditingController: _textEditingController,
          );
        }),
      ),
    );
  }

  void getCurrentText() {
    _textEditingController.text =
        GetIt.I.get<GPTResponseViewModel>().chatGptResponse?.message ?? '';
  }

  void closeThePage() {
    Navigation.ofPop();
  }
}

class GeneratedLyrics extends StatelessWidget {
  const GeneratedLyrics({
    super.key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingSizing.smallEdgeAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              songTitleLabel,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(createdSongName,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          ),
          Padding(
            padding: PaddingSizing.smallEdgeInsetsOnlyR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  songLyricLabel,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Icon(
                  RapGenerator.iconEdit,
                ),
              ],
            ),
          ),
          const SizedBox(height: SizedBoxSpacing.midHeight),
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: BuildRichTextField(
                readOnly: true,
                containerBorder: const Border(top: BorderSide.none),
                containerShadowColor: LayoutColorLibrary.transparentColor,
                containerColor: LayoutColorLibrary.defaultBgColor,
                containerElevation: 0,
                textController: _textEditingController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
