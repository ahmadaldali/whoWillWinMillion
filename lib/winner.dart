import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        Positioned.fill(
          child: Container(color: Colors.white),
        )
      ]),
    );
  }
}
