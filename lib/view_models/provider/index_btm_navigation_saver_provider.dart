import 'package:flutter/material.dart';

class IndexBottomNavigationSaver extends ChangeNotifier {
  int index = 0;
  void setIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}



