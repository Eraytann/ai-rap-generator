import 'package:flutter/material.dart';
import 'package:rap_generator/app/Constants/padding_class.dart';
import 'package:rap_generator/app/Model/GptResponse/viewmodel/gpt_response_view_model.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/progress_widget.dart';
import '../../../Constants/text_class.dart';

class GeneratingLyricsView extends StatefulWidget {
  const GeneratingLyricsView({super.key});

  @override
  State<GeneratingLyricsView> createState() => _GeneratingLyricsViewState();
}

class _GeneratingLyricsViewState extends State<GeneratingLyricsView> {
  final _viewModel = GPTResponseViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.initService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isBackOpen: false,
        title: Text(generatingSongAppBarTitle),
      ),
      body: Container(
        width: defaultMediaQueryWidth(context),
        height: defaultMediaQueryHeight(context),
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            rapperImg,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          ),
                        ),
                        const SizedBox(
                          height: SizedBoxSpacing.midHeight,
                        ),
                        Text(
                          rapperName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: PaddingSizing.midEdgeAll,
                        child: Text(
                          createdSongName,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: loadingIndicator(context),
                    ),
                    Padding(
                      padding: PaddingSizing.customHorizontal,
                      child: Text(
                        progressText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
