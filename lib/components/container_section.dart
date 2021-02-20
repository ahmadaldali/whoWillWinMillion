import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/provider_class.dart';

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
  Color co1 = Color(0xFF03416D);
  Color co2 = Colors.blue[700];
  Color correctColor = Colors.green[500];
  Color selectedColor = Colors.orange[600];

  ContainerSection({this.isQuestion, this.index});

  @override
  Widget build(BuildContext context) {
    String a = "البحر الأسود";
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (Provider.of<ProviderClass>(context, listen: false).canSelected &&
              !isQuestion) {
            co1 = selectedColor;
            co2 = selectedColor;
            Provider.of<ProviderClass>(context, listen: false).setCanSelected();
          }
        },
        child: Consumer<ProviderClass>(builder: (context, sp, child) {
          return Container(
            alignment: Alignment.centerRight,
            width: 20,
            height: isQuestion
                ? MediaQuery.of(context).size.height * 0.09
                : MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
              //color: Color(0xFF003B6F),
              gradient: LinearGradient(
                colors: [
                  co1,
                  co2,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.035,
              ),
              child: Text(
                isQuestion ? 'dddddd' : letter[index] + ' ' + a,
                //textAlign: TextAlign.end,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        }),
      ),
    );
  }
}
