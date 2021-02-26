import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Color wrongColor = Colors.red[600];
  String body;
  String correct;
  double size = 20;
  int answerIndex = 0;
  bool isCorrect;
  bool isWrong;

  ContainerSection(
      {this.isQuestion,
      this.index,
      @required this.body,
      @required this.correct});

  @override
  Widget build(BuildContext context) {
    size = (MediaQuery.of(context).size.height < 700) ? 17 : 20;
    size = (MediaQuery.of(context).size.width < 400) ? 15 : size;

    answerIndex =
        Provider.of<ProviderClass>(context, listen: false).getAnswerIndex;
    isCorrect = Provider.of<ProviderClass>(context, listen: false).getCorrect;
    isWrong = Provider.of<ProviderClass>(context, listen: false).getWrong;

    //orange color for selected
    co1 = (answerIndex == index) ? selectedColor : co1;
    co2 = (answerIndex == index) ? selectedColor : co2;

    //green color for correct answer when answer is correct
    co1 = (answerIndex == index && isCorrect) ? correctColor : co1;
    co2 = (answerIndex == index && isCorrect) ? correctColor : co2;

    //green color for correct answer when answer is wrong
    co1 = (answerIndex != index && this.correct == 'yes' && isWrong)
        ? correctColor
        : co1;
    co2 = (answerIndex != index && this.correct == 'yes' && isWrong)
        ? correctColor
        : co2;

    //red color for wrong answer if exist
    co1 = (answerIndex == index && isWrong) ? wrongColor : co1;
    co2 = (answerIndex == index && isWrong) ? wrongColor : co2;

    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if (!isQuestion &&
              Provider.of<ProviderClass>(context, listen: false)
                  .getcanSelected) {
            Provider.of<ProviderClass>(context, listen: false)
                .setCanSelected(false);
            Provider.of<ProviderClass>(context, listen: false)
                .setAnswerIndex(this.index);
            Provider.of<ProviderClass>(context, listen: false).stopTimer();

            await Future.delayed(new Duration(seconds: 3));
            if (this.correct == 'yes') {
              Provider.of<ProviderClass>(context, listen: false)
                  .setCorrect(true);

              await Future.delayed(new Duration(seconds: 2));
              //next question
              Provider.of<ProviderClass>(context, listen: false).setIndex();
              //reset values to inital
              Provider.of<ProviderClass>(context, listen: false)
                  .setAnswerIndex(-1);
              Provider.of<ProviderClass>(context, listen: false)
                  .setCanSelected(true);
              Provider.of<ProviderClass>(context, listen: false)
                  .setCorrect(false);
            } else {
              Provider.of<ProviderClass>(context, listen: false).setWrong(true);
              Provider.of<ProviderClass>(context, listen: false)
                  .setCorrect(false);
              await Future.delayed(new Duration(seconds: 2));

              //game over
              SystemNavigator.pop();
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
