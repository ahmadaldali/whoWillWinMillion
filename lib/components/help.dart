import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class HelpEclipse extends StatelessWidget {
  String ty;
  HelpEclipse({@required this.ty});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.width * 0.12,
        // color: Colors.pink,
        decoration: BoxDecoration(
          color: Colors.blue[700],
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
        ),
        child: Center(
          child: (ty == 'mark')
              ? FaIcon(
                  FontAwesomeIcons.question,
                  size: MediaQuery.of(context).size.width * 0.06,
                )
              : ((ty == 'questionnaire')
                  ? FaIcon(
                      FontAwesomeIcons.chartBar,
                      size: MediaQuery.of(context).size.width * 0.06,
                    )
                  : FaIcon(
                      FontAwesomeIcons.gripLines,
                      size: MediaQuery.of(context).size.width * 0.06,
                    )),
        ),
      ),
    );
  }
}
