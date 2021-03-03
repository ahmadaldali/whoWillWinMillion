import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/provider_class.dart';

// ignore: must_be_immutable
class ContainerSection extends StatefulWidget {
  bool isQuestion = false;
  int index = 0;
  String body;
  String correct;

  ContainerSection(
      {this.isQuestion,
      this.index,
      @required this.body,
      @required this.correct});

  @override
  _ContainerSectionState createState() => _ContainerSectionState();
}

class _ContainerSectionState extends State<ContainerSection>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  List<String> letter = [
    "ب: ",
    "أ: ",
    "د: ",
    "ج: ",
  ];

  Color initCo1 = Color(0xFF03416D);
  Color initCo2 = Colors.blue[700];
  Color co1;
  Color co2;
  Color correctColor = Colors.green[500];
  Color selectedColor = Colors.orange[600];
  Color wrongColor = Colors.red[600];

  double size = 20;
  int answerIndex = 0;
  bool isCorrect;
  bool isWrong;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    co1 = initCo1;
    co2 = initCo2;

    size = (MediaQuery.of(context).size.height < 700) ? 17 : 22;
    size = (MediaQuery.of(context).size.width < 400) ? 15 : size;

    answerIndex =
        Provider.of<ProviderClass>(context, listen: false).getAnswerIndex;
    isCorrect = Provider.of<ProviderClass>(context, listen: false).getCorrect;
    isWrong = Provider.of<ProviderClass>(context, listen: false).getWrong;

    //orange color for selected
    co1 = (answerIndex == widget.index) ? selectedColor : co1;
    co2 = (answerIndex == widget.index) ? selectedColor : co2;

    //green color for correct answer when answer is correct
    co1 = (answerIndex == widget.index && isCorrect) ? correctColor : co1;
    co2 = (answerIndex == widget.index && isCorrect) ? correctColor : co2;

    //green color for correct answer when answer is wrong
    co1 =
        (answerIndex != widget.index && this.widget.correct == 'yes' && isWrong)
            ? correctColor
            : co1;
    co2 =
        (answerIndex != widget.index && this.widget.correct == 'yes' && isWrong)
            ? correctColor
            : co2;

    //red color for wrong answer if exist
    co1 = (answerIndex == widget.index && isWrong) ? wrongColor : co1;
    co2 = (answerIndex == widget.index && isWrong) ? wrongColor : co2;

    if (co1 == correctColor) {
      _animationController.repeat(reverse: true);
    }

    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if (!widget.isQuestion &&
              Provider.of<ProviderClass>(context, listen: false)
                  .getcanSelected) {
            try {
              Provider.of<ProviderClass>(context, listen: false).stopTimer();

              Provider.of<ProviderClass>(context, listen: false)
                  .setCanSelected(false);
              Provider.of<ProviderClass>(context, listen: false)
                  .setAnswerIndex(this.widget.index);

              await Future.delayed(new Duration(seconds: 3));
              if (this.widget.correct == 'yes') {
                Provider.of<ProviderClass>(context, listen: false)
                    .setCorrect(true);

                await Future.delayed(new Duration(seconds: 3));
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
                Provider.of<ProviderClass>(context, listen: false)
                    .setWrong(true);
                Provider.of<ProviderClass>(context, listen: false)
                    .setCorrect(false);
                await Future.delayed(new Duration(seconds: 3));

                //game over
                Provider.of<ProviderClass>(context, listen: false)
                    .setAnswerIndex(-5); // game over
                Provider.of<ProviderClass>(context, listen: false)
                    .setWinner(-5); // game over
                Provider.of<ProviderClass>(context, listen: false).setIndex();
              }
            } catch (e) {
              print(e);
            }
          }
        },
        child: FadeTransition(
          opacity: _animationController,
          child: Container(
            alignment: Alignment.centerRight,
            width: 200,
            height: widget.isQuestion
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
                widget.isQuestion
                    ? this.widget.body
                    : letter[widget.index] + ' ' + this.widget.body,
                //textAlign: TextAlign.end,
                style: TextStyle(color: Colors.white, fontSize: size),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
