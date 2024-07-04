import 'package:flutter/material.dart';

class AppNavigation with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  AppPage get currentPage =>
      _currentIndex == 0 ? AppPage.home : AppPage.profile;

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

enum AppPage {
  home,
  profile,
}
