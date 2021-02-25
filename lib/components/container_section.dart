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
  String body;
  String correct;
  double size = 20;
  int answerIndex = 0;

  ContainerSection(
      {this.isQuestion,
      this.index,
      @required this.body,
      @required this.correct});

  @override
  Widget build(BuildContext context) {
    size = (MediaQuery.of(context).size.height < 700) ? 17 : 20;
    answerIndex =
        Provider.of<ProviderClass>(context, listen: false).getAnswerIndex;
    co1 = (answerIndex == index) ? selectedColor : co1;
    co2 = (answerIndex == index) ? selectedColor : co2;

    print('index ans  ' +
        index.toString() +
        '::::::::::::::::' +
        answerIndex.toString());

    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if (!isQuestion) {
            Provider.of<ProviderClass>(context, listen: false).stopTimer();
            Provider.of<ProviderClass>(context, listen: false).setCanSelected();
            Provider.of<ProviderClass>(context, listen: false)
                .setAnswerIndex(this.index);

            await Future.delayed(new Duration(seconds: 5));
            if (this.correct == 'yes') {
              //next question
              Provider.of<ProviderClass>(context, listen: false).setIndex();
              Provider.of<ProviderClass>(context, listen: false)
                  .setAnswerIndex(-1);
            } else {
              //game over
            }
          }
        },
        child: Container(
          alignment: Alignment.centerRight,
          width: 200,
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
              right: MediaQuery.of(context).size.width * 0.038,
            ),
            child: Text(
              isQuestion ? this.body : letter[index] + ' ' + this.body,
              //textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: size),
            ),
          ),
        ),
      ),
    );
  }
}
