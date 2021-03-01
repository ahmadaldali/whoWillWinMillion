import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/components/help.dart';
import 'package:who_will_win_million/provider_class.dart';

// ignore: must_be_immutable
class AllHelps extends StatelessWidget {
  int _index;
  int _winner;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder: (context, value, child) {
        _index = value.getIndex;
        _winner = value.getWinner;

        return (_index == _winner)
            ? Row(
                children: [
                  HelpEclipse(
                    ty: 'winner',
                  )
                ],
              )
            : Row(
                children: [
                  HelpEclipse(
                    ty: 'mark',
                  ),
                  HelpEclipse(
                    ty: '50',
                  ),
                  HelpEclipse(
                    ty: 'questionnaire',
                  ),
                ],
              );
      },
    );
  }
}
