import 'dart:async';

import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  //for colors of answers (selected & correct & wrong)
  bool _canSelected = true;
  bool _correctAnswer = false;
  bool _wrongAnswer = false;

  int _index = 0; //index of current question
  int _start = 30; //timer
  int _answerIndex = -1; // for inital no selected color
  int _winnerIndex = 1; //
  Timer _timer;

  bool get getcanSelected {
    return _canSelected;
  }

  bool get getCorrect {
    return _correctAnswer;
  }

  bool get getWrong {
    return _wrongAnswer;
  }

  int get getIndex {
    return _index;
  }

  int get getAnswerIndex {
    return _answerIndex;
  }

  int get getWinner {
    return _winnerIndex;
  }

  int get getTimer {
    return _start;
  }

  void setCanSelected(bool value) {
    _canSelected = value;
    //notifyListeners();
  }

  void setCorrect(bool value) {
    _correctAnswer = value;
    notifyListeners();
  }

  void setWrong(bool value) {
    _wrongAnswer = value;
    //notifyListeners();
  }

  void setIndex() {
    stopTimer();
    _index++;
    _start = 30;
    notifyListeners();
    if (_index < _winnerIndex) {
      decreaseTimer();
    } else {
      stopTimer();
    }
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
    if (_index < _winnerIndex) {
      notifyListeners();
    }
  }
}
