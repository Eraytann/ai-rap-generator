import 'package:flutter/material.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/progress_widget.dart';
import '../../../constants.dart';

class GeneratingLyricsView extends StatefulWidget {
  const GeneratingLyricsView({super.key});

  @override
  State<GeneratingLyricsView> createState() => _GeneratingLyricsViewState();
}

class _GeneratingLyricsViewState extends State<GeneratingLyricsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isBackOpen: false,
        title: Text(generatingSongAppBarTitle),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                          height: 20,
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
                        padding: const EdgeInsets.all(16.0),
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
                      padding: const EdgeInsets.only(left: 120, right: 120),
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
