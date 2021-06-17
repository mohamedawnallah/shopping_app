import 'package:flutter/material.dart';

class DarkModeSaverProvider extends ChangeNotifier {
  bool isDarkMode=false ;
  void setIsDarkMode(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}
