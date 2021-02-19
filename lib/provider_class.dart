import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  bool canSelected = true;

  bool get getcanSelected {
    return canSelected;
  }

  void setCanSelected() {
    canSelected = false;
    notifyListeners();
  }
}
