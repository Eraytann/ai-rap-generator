import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'page_controller_manager.g.dart';

enum Pages {
  promptPage,
  generatingLyricsPage,
  generatedLyricsPage,
  editLyricsPage,
  beatsPage,
  rapperPage,
  songPage,
}

// ignore: library_private_types_in_public_api
class PageControllerManager = _PageControllerManagerBase
    with _$PageControllerManager;

abstract class _PageControllerManagerBase with Store {
  late PageController _pageController;

  @observable
  Pages? _selectedSegment;

  _PageControllerManagerBase(Pages initialPage) {
    _pageController = PageController(initialPage: initialPage.index);
    _selectedSegment = initialPage;
  }

  @action
  void setSelectedSegment(Pages selectedSegment) {
    _selectedSegment = selectedSegment;
  }

  @computed
  Pages? get selectedSegment => _selectedSegment;

  @computed
  PageController get pageController => _pageController;

  @action
  Future<void> pageChangeControl() async {
    _selectedSegment =
        Pages.values[(_selectedSegment!.index + 1) % Pages.values.length];
    _navigateToSelectedSegment();
  }

  @action
  void navigateToGeneratedLyricsPage() {
    _selectedSegment = Pages.generatedLyricsPage;
    _navigateToSelectedSegment();
  }

  @action
  void navigateToSongPage() {
    _selectedSegment = Pages.songPage;
    _navigateToSelectedSegment();
  }

  @action
  void navigateToEditLyricsPage() {
    if (_selectedSegment != Pages.rapperPage) {
      _selectedSegment =
          Pages.values[(_selectedSegment!.index + 1) % Pages.values.length];
      _navigateToSelectedSegment();
    }
  }

  @action
  void navigateToRapperPage() {
    _selectedSegment = Pages.rapperPage;
    _navigateToSelectedSegment();
  }

  @action
  void _navigateToSelectedSegment() {
    _pageController.animateToPage(
      _selectedSegment!.index,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  Widget buildPageView(List<Widget> pages) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: pages,
    );
  }
}
