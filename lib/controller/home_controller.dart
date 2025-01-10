import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
