import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/components/container_section.dart';
import 'package:who_will_win_million/components/help.dart';
import 'package:who_will_win_million/components/money_text.dart';
import 'package:who_will_win_million/database/answers.dart';
import 'package:who_will_win_million/money.dart';
import 'package:who_will_win_million/provider_class.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  int _start;
  List<dynamic> levels;
  int index;
  double size;

  @override
  void initState() {
    levels = null;
    initLevels();
    index = 0;
    _start = 30;
    //startTimer();
    Provider.of<ProviderClass>(context, listen: false).decreaseTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void initLevels() async {
    levels = await Answers.getGame();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = (MediaQuery.of(context).size.height < 700) ? 17 : 20;
    size = (MediaQuery.of(context).size.width < 400) ? 15 : size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Color(0xFF03416D),
        centerTitle: true,
        title: Text('من سيربح المليون'),
      ),
      body: levels == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Consumer<ProviderClass>(
                  builder: (context, value, child) {
                    index = value.getIndex;
                    _start = value.getTimer;
                    return (_start <= 0)
                        ? Text(
                            'خسرت',
                            style: TextStyle(color: Colors.white),
                          )
                        : (index == 15)
                            ? Text(
                                'فزت',
                                style: TextStyle(color: Colors.white),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MoneyText(
                                        index: 15,
                                      ),
                                      MoneyText(
                                        index: 14,
                                      ),
                                      MoneyText(
                                        index: 13,
                                      ),
                                      MoneyText(
                                        index: 12,
                                      ),
                                      MoneyText(
                                        index: 11,
                                      ),
                                      MoneyText(
                                        index: 10,
                                      ),
                                      MoneyText(
                                        index: 9,
                                      ),
                                      MoneyText(
                                        index: 8,
                                      ),
                                      MoneyText(
                                        index: 7,
                                      ),
                                      MoneyText(
                                        index: 6,
                                      ),
                                      MoneyText(
                                        index: 5,
                                      ),
                                      MoneyText(
                                        index: 4,
                                      ),
                                      MoneyText(
                                        index: 3,
                                      ),
                                      MoneyText(
                                        index: 2,
                                      ),
                                      MoneyText(
                                        index: 1,
                                      ),
                                    ],
                                  ),
                                  Row(
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
                                  ),
                                  Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              ContainerSection(
                                                isQuestion: true,
                                                body: levels.elementAt(
                                                    index)['question'],
                                                correct: 'no',
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            children: [
                                              ContainerSection(
                                                isQuestion: false,
                                                index: 0,
                                                body: levels
                                                    .elementAt(index)['answers']
                                                        [0]
                                                    .answer,
                                                correct: levels
                                                    .elementAt(index)['answers']
                                                        [0]
                                                    .correct,
                                              ),
                                              Container(
                                                width: 20,
                                              ),
                                              ContainerSection(
                                                isQuestion: false,
                                                index: 1,
                                                body: levels
                                                    .elementAt(index)['answers']
                                                        [1]
                                                    .answer,
                                                correct: levels
                                                    .elementAt(index)['answers']
                                                        [1]
                                                    .correct,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            children: [
                                              ContainerSection(
                                                isQuestion: false,
                                                index: 2,
                                                body: levels
                                                    .elementAt(index)['answers']
                                                        [2]
                                                    .answer,
                                                correct: levels
                                                    .elementAt(index)['answers']
                                                        [2]
                                                    .correct,
                                              ),
                                              Container(
                                                width: 20,
                                              ),
                                              ContainerSection(
                                                isQuestion: false,
                                                index: 3,
                                                body: levels
                                                    .elementAt(index)['answers']
                                                        [3]
                                                    .answer,
                                                correct: levels
                                                    .elementAt(index)['answers']
                                                        [3]
                                                    .correct,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.392,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.142,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3),
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                          child: Center(
                                            child: Text(
                                              "$_start",
                                              style: TextStyle(
                                                color: (_start > 10)
                                                    ? Colors.white
                                                    : Colors.red[500],
                                                fontSize: size,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          //color: Color(0xFF003B6F),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF03416D),
                                              Colors.blue[700],
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          'SY ' + Money.getMoney(index),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                  },
                ),
              ),
            ),
    );
  }
}
