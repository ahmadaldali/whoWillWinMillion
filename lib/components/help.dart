import 'package:flutter/material.dart';

class HelpEclipse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        /////alignment: Alignment.centerLeft,
        ///
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025,
            vertical: MediaQuery.of(context).size.height * 0.02),
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.15,
        // color: Colors.pink,
        decoration: BoxDecoration(
          color: Colors.blue[700],
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
        ),
      ),
    );
  }
}
