import 'package:flutter/material.dart';
import 'package:who_will_win_million/money.dart';

// ignore: must_be_immutable
class MoneyText extends StatelessWidget {
  int index;
  String _txt;
  double _size;
  Color _co = Colors.yellow[600];
  String _val;

  MoneyText({this.index});
  @override
  Widget build(BuildContext context) {
    _val = Money.getMoney(index);
    _size = (MediaQuery.of(context).size.height < 700) ? 12 : 17;
    _size = (MediaQuery.of(context).size.width < 400) ? 10 : _size;

    _txt = _val + '     ' + index.toString();
    _txt = (index < 10) ? _txt + '  ' : _txt;

    _co = (index == 5 || index == 10 || index == 15) ? Colors.white : _co;
    return Text(
      _txt,
      style: TextStyle(
        color: _co,
        fontSize: _size,
      ),
    );
  }
}
