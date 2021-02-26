import 'package:flutter/material.dart';
import 'package:who_will_win_million/components/money_text.dart';

class MoneyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MoneyText(
          index: 15,
        ),
        MoneyText(
          index: 14,
        ),
        MoneyText(
          index: 13,
        ),
        MoneyText(
          index: 12,
        ),
        MoneyText(
          index: 11,
        ),
        MoneyText(
          index: 10,
        ),
        MoneyText(
          index: 9,
        ),
        MoneyText(
          index: 8,
        ),
        MoneyText(
          index: 7,
        ),
        MoneyText(
          index: 6,
        ),
        MoneyText(
          index: 5,
        ),
        MoneyText(
          index: 4,
        ),
        MoneyText(
          index: 3,
        ),
        MoneyText(
          index: 2,
        ),
        MoneyText(
          index: 1,
        ),
      ],
    );
  }
}
