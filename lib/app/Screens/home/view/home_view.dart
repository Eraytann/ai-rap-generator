import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Constants/padding_class.dart';
import 'package:rap_generator/app/Features/premium_check/premium_check.dart';
import 'package:rap_generator/app/Navigation/navigator.dart';
import 'package:rap_generator/app/Screens/home/viewmodel/home_view_model.dart';
import 'package:rap_generator/app/Screens/song_creator/view/song_creator_view.dart';
import '../../../Constants/color_class.dart';
import '../../../Constants/custom_font_class.dart';
import '../../../Model/GptResponse/viewmodel/gpt_response_view_model.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/circle_button_widget.dart';
import '../../../Constants/text_class.dart';
import '../../../rap_generator_icons.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = HomeViewModel();
  final GPTResponseViewModel viewModel = GetIt.I.get<GPTResponseViewModel>();
  final CounterStore _counterStore = GetIt.I.get<CounterStore>();

  @override
  void initState() {
    _viewModel.loadCounterValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        isBackOpen: false,
        leadingIcon: null,
        title: const Text(mainAppBarTitle),
        actions: IconButton(
          onPressed: () {
            _viewModel.appbarNavigateToPage();
          },
          icon: const Icon(RapGenerator.iconSettings),
        ),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  onPressed: () {
                    _viewModel.preCheck();
                  },
                ),
                buildText(
                  startButtonText,
                  CustomFontSizes.createButtonFontSize,
                  TextColorLibrary.homeStartLabelColor,
                ),
                buildText(
                  generateLabelText,
                  CustomFontSizes.generateLabelFontSize,
                  TextColorLibrary.homeStartLabelColor,
                ),
                const SizedBox(height: SizedBoxSpacing.smallHeight),
                Observer(builder: (_) {
                  return Text(
                    _counterStore.counter == -1
                        ? memberTypeText
                        : '$remainingTime ${_counterStore.counter.toString()}',
                  );
                }),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LayoutColorLibrary.defaultRedColor,
        isExtended: true,
        onPressed: () {
          Navigation.push(
            page: const SongCreatorView(),
          );
        },
        child: const Icon(
          Icons.library_music_rounded,
          color: LayoutColorLibrary.whiteIcon,
        ),
      ),
    );
  }

  Widget buildText(String text, double fontsize, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontsize),
    );
  }
}
