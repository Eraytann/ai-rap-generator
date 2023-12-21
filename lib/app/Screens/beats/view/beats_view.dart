import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Screens/prompts_page/viewmodel/store/page_store.dart';
import '../../../Model/Uberduck/BackingTracks/model/model_backing_track.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/Music Player/music_player.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/progress_widget.dart';
import '../../../constants.dart';
import '../../../rap_generator_icons.dart';
import '../viewmodel/beats_view_model.dart';
import '../widgets/error_widgets.dart';

PageStore _pageStore = PageStore();

class BeatsView extends StatefulWidget {
  const BeatsView({super.key});

  @override
  State<BeatsView> createState() => _BeatsViewState();
}

class _BeatsViewState extends State<BeatsView> {
  final BeatsViewModel _viewModel = GetIt.I.get<BeatsViewModel>();

  @override
  void initState() {
    super.initState();
    _pageStore.currentGradient = null;
    _viewModel.selectedBeatIndex = -1;
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.audioPlayerViewModel.stopAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackOpen: true,
        leadingIcon: IconButton(
          onPressed: () {
            Navigation.ofPop();
          },
          icon: const Icon(RapGenerator.iconPrevious),
        ),
        title: const Text(selectBeatAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: buildFutureBuilder(),
        ),
      ),
    );
  }

  Widget buildFutureBuilder() {
    return FutureBuilder<List<BackingTrackModel>>(
      future: _viewModel.fetchBeats(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator(context);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error.toString());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return buildNoDataWidget();
        } else {
          List<BackingTrackModel> backingTracks = snapshot.data!;
          return buildListView(backingTracks);
        }
      },
    );
  }

  Widget buildListView(List<BackingTrackModel> backingTracks) {
    return ListView.builder(
      itemCount: backingTracks.length,
      itemBuilder: (context, index) {
        BackingTrackModel track = backingTracks[index];
        return Observer(
          builder: (_) => BuildBeatCards(
            apiData: [track.name],
            onClick: () {
              _viewModel.onClickControl(track, index);
              _viewModel.selectedBeatIndex =
                  _viewModel.selectedBeatIndex == index ? -1 : index;
            },
            isSelected: index == _viewModel.selectedBeatIndex,
          ),
        );
      },
    );
  }
}
