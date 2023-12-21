import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Widgets/app_bar_widget.dart';
import 'package:rap_generator/app/constants.dart';
import '../../../Model/GptResponse/viewmodel/gpt_response_view_model.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/rich_textfield.dart';
import '../../../rap_generator_icons.dart';

class EditLyricsView extends StatefulWidget {
  const EditLyricsView({super.key});

  @override
  State<EditLyricsView> createState() => _EditLyricsViewState();
}

class _EditLyricsViewState extends State<EditLyricsView> {
  final TextEditingController _textEditingController = TextEditingController();
  final GPTResponseViewModel viewModel = GetIt.I.get<GPTResponseViewModel>();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text =
        GetIt.I.get<GPTResponseViewModel>().chatGptResponse?.message ?? '';

    return Scaffold(
      appBar: CustomAppBar(
        isBackOpen: true,
        leadingIcon: IconButton(
          onPressed: () {
            Navigation.ofPop();
          },
          icon: const Icon(RapGenerator.iconPrevious),
        ),
        title: const Text(editAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BuildRichTextField(
                  containerBorder: const Border(top: BorderSide.none),
                  containerShadowColor: Colors.transparent,
                  containerColor: Colors.white,
                  containerElevation: 0,
                  textController: _textEditingController),
            ),
          ],
        ),
      ),
    );
  }
}
