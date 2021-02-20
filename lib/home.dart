import 'dart:async';
import 'package:flutter/material.dart';
import 'package:who_will_win_million/components/container_section.dart';
import 'package:who_will_win_million/components/help.dart';
import 'package:who_will_win_million/components/money_text.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;

  int _start;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _start = 31;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Color(0xFF03416D),
        centerTitle: true,
        title: Text('من سيربح المليون'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MoneyText(
                    val: '1,000,000',
                    index: 15,
                  ),
                  MoneyText(
                    val: '500,000',
                    index: 14,
                  ),
                  MoneyText(
                    val: '250,000',
                    index: 13,
                  ),
                  MoneyText(
                    val: '125,000',
                    index: 12,
                  ),
                  MoneyText(
                    val: '64,000',
                    index: 11,
                  ),
                  MoneyText(
                    val: '32,000',
                    index: 10,
                  ),
                  MoneyText(
                    val: '16,000',
                    index: 9,
                  ),
                  MoneyText(
                    val: '8,000',
                    index: 8,
                  ),
                  MoneyText(
                    val: '4,000',
                    index: 7,
                  ),
                  MoneyText(
                    val: '2,000',
                    index: 6,
                  ),
                  MoneyText(
                    val: '1,000',
                    index: 5,
                  ),
                  MoneyText(
                    val: '500',
                    index: 4,
                  ),
                  MoneyText(
                    val: '300',
                    index: 3,
                  ),
                  MoneyText(
                    val: '200',
                    index: 2,
                  ),
                  MoneyText(
                    val: '100',
                    index: 1,
                  ),
                ],
              ),
              Row(
                children: [
                  HelpEclipse(),
                  HelpEclipse(),
                  HelpEclipse(),
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          ContainerSection(
                            isQuestion: false,
                            index: 0,
                          ),
                          Container(
                            width: 20,
                          ),
                          ContainerSection(
                            isQuestion: false,
                            index: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ContainerSection(
                            isQuestion: false,
                            index: 2,
                          ),
                          Container(
                            width: 20,
                          ),
                          ContainerSection(
                            isQuestion: false,
                            index: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.375,
                    top: MediaQuery.of(context).size.height * 0.143,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          shape: BoxShape.circle,
                          color: Colors.black),
                      child: Center(
                        child: Text(
                          "$_start",
                          style: TextStyle(
                            color:
                                (_start > 10) ? Colors.white : Colors.red[500],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
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
                      child: Expanded(
                        child: Text(
                          'dsfdsf',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
