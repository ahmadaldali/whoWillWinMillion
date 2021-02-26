import 'package:flutter/material.dart';
import 'package:who_will_win_million/components/help.dart';

class AllHelps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
  }
}
