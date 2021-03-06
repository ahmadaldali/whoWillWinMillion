import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/money.dart';
import 'package:who_will_win_million/provider_class.dart';

// ignore: must_be_immutable
class ValueOfGame extends StatelessWidget {
  double _size;
  int _index;
  int _winner;
  String _val = '0';

  @override
  Widget build(BuildContext context) {
    _size = (MediaQuery.of(context).size.height < 700) ? 17 : 22;
    _size = (MediaQuery.of(context).size.width < 400) ? 15 : _size;

    return Consumer<ProviderClass>(
      builder: (context, value, child) {
        _index = value.getIndex;
        _winner = value.getWinner;
        _val = (_winner == -5) ? '0' : Money.getMoney(_index);
        return Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                //color: Color(0xFF003B6F),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF03416D),
                    Colors.blue[700],
                  ],
                ),
              ),
              child: Text(
                'SY ' + _val,
                style: TextStyle(color: Colors.white, fontSize: _size),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
