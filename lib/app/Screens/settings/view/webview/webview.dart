import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rap_generator/app/Navigation/navigator.dart';
import 'package:rap_generator/app/Widgets/app_bar_widget.dart';
import 'package:rap_generator/app/rap_generator_icons.dart';

import '../../../../constants.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late InAppWebViewController _webViewController;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackOpen: true,
        leadingIcon: IconButton(
          icon: const Icon(
            RapGenerator.iconPrevious,
            color: whiteIcon,
          ),
          onPressed: closePage,
        ),
        backgroundColor: progressBarColor,
        title: const Text(
          webviewUrl,
          style: TextStyle(color: whiteTextColor),
        ),
        actions: IconButton(
          onPressed: refreshPage,
          icon: const Icon(
            RapGenerator.iconRefresh,
            color: whiteIcon,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(0.5),
            child: progress < 1.0
                ? LinearProgressIndicator(
                    value: progress,
                    color: progressBarColor,
                  )
                : Container(),
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(webviewUrl)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(
                  () {
                    this.progress = progress / 100;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void refreshPage() {
    _webViewController.reload();
  }

  void closePage() {
    Navigation.ofPop();
  }
}
