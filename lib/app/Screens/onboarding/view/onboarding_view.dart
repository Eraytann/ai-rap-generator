import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Navigation/navigator.dart';
import '../../../Widgets/elevated_button_widget.dart';
import '../../../Widgets/slider_widget.dart';
import '../../../constants.dart';
import '../../home/view/home_view.dart';
import '../viewmodel/onboarding_view_model.dart';

enum Pages { page1, page2, page3, page4 }

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _viewModel = OnboardingViewModel();

  Pages _selectedSegment = Pages.page1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _viewModel.currentPage);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return _pageView();
            }),
            CustomPageIndicator(pageController: _pageController),
            const SizedBox(
              height: 40,
            ),
            _forwardButton(),
            const SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  ElevatedButtonWidget _forwardButton() {
    return ElevatedButtonWidget(
      onPressed: () {
        setState(() {
          if (_selectedSegment != Pages.page4) {
            saveLoginStatus(true);
            _viewModel.setCurrentPage(_selectedSegment.index);
            _selectedSegment = Pages
                .values[(_selectedSegment.index + 1) % Pages.values.length];
            _pageController.animateToPage(
              _selectedSegment.index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            Navigation.pushAndRemoveAll(
              page: const HomeView(),
            );
          }
        });
      },
      color: Colors.pink,
      text: elevatedButtonNext,
      gradient: gradientButtonColor,
    );
  }

  Expanded _pageView() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        children: const [
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding/img_onboarding1.png',
            headline: onboardingHeadline1,
            content: onboardingText1,
          ),
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding/img_onboarding2.png',
            headline: onboardingHeadline2,
            content: onboardingText2,
          ),
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding/img_onboarding3.png',
            headline: onboardingHeadline3,
            content: onboardingText3,
          ),
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding/img_onboarding4.png',
            headline: onboardingHeadline4,
            content: onboardingText4,
          ),
        ],
        onPageChanged: (index) {
          _viewModel.setCurrentPage(index);
          _selectedSegment = Pages.values[index];
        },
      ),
    );
  }
}

class OnboardingPageContent extends StatelessWidget {
  final String? imagePath;
  final String headline;
  final String content;
  const OnboardingPageContent(
      {super.key,
      this.imagePath,
      required this.content,
      required this.headline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Positioned(
            child:
                Image.asset('assets/images/onboarding/img_onboarding_bg2.png'),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              color: const Color.fromRGBO(250, 250, 250, 250),
              child: Image.asset(
                imagePath!,
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Image.asset('assets/images/onboarding/rectangle_img.png'),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  headline,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
