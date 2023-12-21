import 'package:flutter/material.dart';
import 'package:rap_generator/app/constants.dart';
import 'progress_widget.dart';

class LoadingDialog {
  final BuildContext context;
  final String text;
  final String title;
  final String progressText;
  final bool showRapperInfo;

  LoadingDialog({
    required this.progressText,
    required this.context,
    required this.text,
    required this.title,
    this.showRapperInfo = false,
  });

  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          insetAnimationCurve: Curves.easeInToLinear,
          insetAnimationDuration: const Duration(milliseconds: 400),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (showRapperInfo)
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
                              text,
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
                        Flexible(
                          flex: 0,
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
      },
    );
  }
}



//ne olur ne olmaz
/*
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog.fullscreen(
            insetAnimationCurve: Curves.easeInToLinear,
            insetAnimationDuration: const Duration(milliseconds: 400),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.zero,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        promptController.text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Lottie.asset(lottieLoading),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Text(loadingText),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
*/