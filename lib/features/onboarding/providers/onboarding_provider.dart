import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  late PageController _pageController;

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  OnboardingProvider() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      _currentPage = _pageController.page!.round();
    });
  }

  void setCurrentIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    _currentPage++;

    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        (_currentPage - 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
