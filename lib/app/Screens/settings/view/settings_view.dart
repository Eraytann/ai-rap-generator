import 'package:flutter/material.dart';
import 'package:rap_generator/app/Constants/padding_class.dart';
import 'package:rap_generator/app/Navigation/navigator.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Constants/text_class.dart';
import '../../../rap_generator_icons.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: const Color.fromARGB(250, 250, 250, 250),
        isBackOpen: false,
        leadingIcon: IconButton(
          onPressed: closePage,
          icon: const Icon(RapGenerator.iconPrevious),
        ),
        title: const Text(settingsAppBarTitle),
      ),
      body: Container(
        color: const Color.fromARGB(250, 250, 250, 250),
        child: Padding(
          padding: PaddingSizing.midEdgeAll,
          child: GestureDetector(
            onTap: () => navigateToWebview(),
            child: const SettingsButtons(),
          ),
        ),
      ),
    );
  }

  void closePage() => Navigation.ofPop();
}
