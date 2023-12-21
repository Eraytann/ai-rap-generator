import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/ApiService/api_service.dart';
import 'package:rap_generator/app/Features/premium_check/premium_check.dart';
import 'package:rap_generator/app/Navigation/navigator.dart';
import 'package:rap_generator/app/Screens/beats/viewmodel/beats_view_model.dart';
import 'package:rap_generator/app/Screens/rapper/viewmodel/rapper_view_model.dart';
import 'package:rap_generator/app/Screens/song/view/song_view.dart';
import 'package:rap_generator/app/Screens/song/viewmodel/song_view_model.dart';
import '../../../Model/GptResponse/viewmodel/gpt_response_view_model.dart';
import '../../../Widgets/Music Player/viewmodel/audio_player_view_model.dart';
import '../../../Widgets/elevated_button_widget.dart';
import '../../../Widgets/loading_page.dart';
import '../../../constants.dart';
import '../../beats/view/beats_view.dart';
import '../../edit_lyrics/view/edit_lyrics_view.dart';
import '../../generated_lyrics/view/generated_lyrics_view.dart';
import '../../generating_lyrics_progress/view/generating_lyrics_progress.dart';
import '../../prompt/view/prompt_view.dart';
import '../../rapper/view/rapper_view.dart';
import '../viewmodel/page_controller_manager.dart';
import '../viewmodel/store/page_store.dart';

final ApiService apiService = ApiService();
final CounterStore counterStore = CounterStore();

class PromtsPage extends StatefulWidget {
  const PromtsPage({super.key});

  @override
  State<PromtsPage> createState() => _PromtsPageState();
}

class _PromtsPageState extends State<PromtsPage> {
  final GPTResponseViewModel _viewModel = GetIt.I.get<GPTResponseViewModel>();
  late PageControllerManager _pageControllerManager;
  final PageStore _pageStore = GetIt.I.get<PageStore>();
  final BeatsViewModel _beatsViewModel = GetIt.I.get<BeatsViewModel>();
  final RapperViewModel _rapperViewModel = GetIt.I.get<RapperViewModel>();
  final SongViewModel _songViewModel = GetIt.I.get<SongViewModel>();
  final AudioPlayerViewModel _audioPlayerViewModel = AudioPlayerViewModel();

  @override
  void initState() {
    super.initState();
    _pageControllerManager = PageControllerManager(Pages.promptPage);
    _pageStore.currentGradient = null;
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayerViewModel.dispose();
  }

  void _generateData() async {
    _showLoadingDialog();

    try {
      await _viewModel.fetchGPTResponse(promptController.text);
      await Future.delayed(
        const Duration(seconds: 5),
      );
      _pageStore.parseText(_viewModel.chatGptResponse?.message ?? '');
      _pageControllerManager.navigateToGeneratedLyricsPage();
    } finally {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  void _showLoadingDialog() {
    LoadingDialog(
      title: generatingAppBarTitle,
      context: context,
      text: promptController.text,
      progressText: progressMessage,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: promptPageBg,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: _pageControllerManager.buildPageView(
                [
                  const PromptView(),
                  const GeneratingLyricsView(),
                  const GeneratedLyricsView(),
                  const EditLyricsView(),
                  const BeatsView(),
                  const RapperView(),
                ],
              ),
            ),
            Observer(builder: (_) {
              return Flexible(
                flex: 0,
                fit: FlexFit.loose,
                child: controlButton(),
              );
            }),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButtonWidget controlButton() {
    return ElevatedButtonWidget(
      onPressed: () async {
        switch (_pageControllerManager.selectedSegment) {
          case Pages.promptPage:
            if (promptController.text.isNotEmpty) {
              _generateData();
              _pageStore.changeButtonColor();
            }
            break;
          case Pages.generatedLyricsPage:
            _pageControllerManager.navigateToEditLyricsPage();
            _pageStore.changeButtonColor();
            break;
          case Pages.editLyricsPage:
            _pageControllerManager.navigateToEditLyricsPage();
            _pageStore.changeButtonColor();
            break;
          case Pages.beatsPage:
            if (_beatsViewModel.selectedTrackUUID != null) {
              _pageControllerManager.navigateToRapperPage();
              _pageStore.changeButtonColor();
            }
            break;
          case Pages.rapperPage:
            if (_rapperViewModel.selectedVoiceModelUUID != null) {
              _pageStore.finalFunc();
              sendData();
              _pageStore.changeButtonColor();
            }
            break;
          default:
            await _pageControllerManager.pageChangeControl();
            break;
        }
      },
      gradient: _pageStore.currentGradient,
      color: elevatedButtonPromptColor,
      text: elevatedButtonContinue,
    );
  }

  Widget buildPageView(List<Widget> pages) {
    return PageView(
      controller: _pageControllerManager.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: pages,
    );
  }

  void sendData() async {
    try {
      Navigation.pushReplace(page: const GeneratingLyricsView());
      await _songViewModel.fetchAndSetSong(_beatsViewModel.selectedTrackUUID,
          _rapperViewModel.selectedVoiceModelUUID, _pageStore.parsedText);
      await Future.delayed(
        const Duration(seconds: 3),
      );
      await Navigation.pushReplace(
        page: const SongView(),
      );
    } finally {
      // ignore: use_build_context_synchronously
      Navigation.ofPop();
    }
  }
}
