import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MoneyText extends StatelessWidget {
  String val;
  int index;
  String _txt;
  Color _co = Colors.yellow[600];

  MoneyText({this.val, this.index});
  @override
  Widget build(BuildContext context) {
    _txt = val + '     ' + index.toString();
    _txt = (index < 10) ? _txt + '  ' : _txt;
    _co = (index == 5 || index == 10 || index == 15) ? Colors.white : _co;
    return Text(
      _txt,
      style: TextStyle(color: _co, fontSize: 16),
    );
  }
}
