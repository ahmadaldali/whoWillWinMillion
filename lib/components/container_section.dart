import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ContainerSection extends StatelessWidget {
  bool isQuestion = false;
  int index = 0;
  List<String> letter = [
    "ب: ",
    "أ: ",
    "د: ",
    "ج: ",
  ];
  ContainerSection({this.isQuestion, this.index});
  @override
  Widget build(BuildContext context) {
    String a = "البحر الأسود";

    return Expanded(
      child: Container(
        width: 20,
        height: isQuestion
            ? MediaQuery.of(context).size.height * 0.10
            : MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          //color: Color(0xFF003B6F),
          gradient: LinearGradient(
            colors: [
              Color(0xFF03416D),
              Colors.blue[700],
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isQuestion ? 'dddddd' : letter[index] + ' ' + a,
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
