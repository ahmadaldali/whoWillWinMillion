import 'dart:async';

import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  bool _canSelected = true;
  int _index = 0;
  int _start = 30;
  int _answerIndex = -1; // for inital no selected color
  Timer _timer;

  bool get getcanSelected {
    return _canSelected;
  }

  int get getIndex {
    return _index;
  }

  int get getAnswerIndex {
    return _answerIndex;
  }

  int get getTimer {
    return _start;
  }

  void setCanSelected() {
    _canSelected = false;
    notifyListeners();
  }

  void setIndex() {
    stopTimer();
    _index++;
    _start = 30;
    notifyListeners();
    decreaseTimer();
  }

  void setAnswerIndex(int i) {
    _answerIndex = i;
  }

  void decreaseTimer() async {
    await Future.delayed(Duration(seconds: 1));
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
        }
        notifyListeners();
      },
    );
  }

  void stopTimer() {
    _timer.cancel();
  }

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 1), () => "1");
  }
}
