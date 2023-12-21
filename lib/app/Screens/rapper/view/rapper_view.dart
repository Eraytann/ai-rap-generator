import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Model/voice_model/voice_model.dart';
import 'package:rap_generator/app/Widgets/Music%20Player/store/click_store.dart';
import 'package:rap_generator/app/Widgets/Music%20Player/viewmodel/audio_player_view_model.dart';
import 'package:rap_generator/app/Widgets/app_bar_widget.dart';
import 'package:rap_generator/app/constants.dart';
import 'package:rap_generator/app/rap_generator_icons.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/progress_widget.dart';
import '../viewmodel/rapper_view_model.dart';

class RapperView extends StatefulWidget {
  final void Function()? onClick;
  const RapperView({super.key, this.onClick});

  @override
  State<RapperView> createState() => _RapperViewState();
}

class _RapperViewState extends State<RapperView> {
  final RapperViewModel _viewModel = GetIt.I.get<RapperViewModel>();
  final AudioPlayerViewModel _audioPlayerViewModel = AudioPlayerViewModel();
  final ClickStore _clickStore = ClickStore();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchVoiceUuids();
  }

  @override
  void dispose() {
    _audioPlayerViewModel.stopAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackOpen: true,
        title: const Text(rapperAppBarTitle),
        leadingIcon: IconButton(
          onPressed: () {
            Navigation.ofPop();
          },
          icon: const Icon(RapGenerator.iconPrevious),
        ),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: _viewModel.fetchVoiceUuids(),
                builder: (context, snapshot) {
                  return fetchDatas(snapshot, context);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget fetchDatas(AsyncSnapshot<void> snapshot, BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loadingIndicator(context);
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return buildVoiceList(_viewModel.voiceList);
    }
  }

  Widget buildVoiceList(List<VoiceModel> voiceList) {
    List<String> rapperImages = addBg();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        mainAxisExtent: 182,
      ),
      itemCount: voiceList.length,
      itemBuilder: (context, index) {
        final voice = voiceList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: SizedBox(
              height: 182,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/rappers/${rapperImages[index]}',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15.0, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (voice.displayName.toString().length > 15)
                              ? '${voice.displayName.toString().substring(0, 15)}...'
                              : voice.displayName.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: rapperNameTextColor,
                          ),
                        ),
                        Observer(builder: (_) {
                          return GestureDetector(
                            onTap: () {
                              handlePlayButton(index, voice);
                            },
                            child: Icon(
                              (_clickStore.isButtonClickedList[index])
                                  ? RapGenerator.iconPauseSong
                                  : RapGenerator.iconPlay,
                              color: defaultButtonColor,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void handlePlayButton(int index, VoiceModel voice) {
    if (_clickStore.isButtonClickedList[index]) {
      _audioPlayerViewModel.stopAudio();
      _clickStore.handleIconTap(index);
    } else {
      _audioPlayerViewModel.playAudio(voice.url.toString());
      _clickStore.handleIconTap(index);
      _viewModel.selectedVoiceModelUUID = voice.voicemodelUuid;
    }
  }

  List<String> addBg() {
    List<String> rapperImages = [];

    for (int i = 1; i <= 10; i++) {
      String imagePath = 'img_rapper$i.png';
      rapperImages.add(imagePath);
    }
    return rapperImages;
  }
}
