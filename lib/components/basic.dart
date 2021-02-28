import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/components/container_section.dart';
import 'package:who_will_win_million/provider_class.dart';
import 'package:who_will_win_million/winner.dart';

// ignore: must_be_immutable
class Basic extends StatelessWidget {
  List<dynamic> levels;
  int _start = 30;
  int _index = 0;
  int _winner;
  double _size;

  Basic(this.levels);

  @override
  Widget build(BuildContext context) {
    _size = (MediaQuery.of(context).size.height < 700) ? 17 : 22;
    _size = (MediaQuery.of(context).size.width < 400) ? 15 : _size;
    return Consumer<ProviderClass>(builder: (context, value, child) {
      _index = value.getIndex;
      _start = value.getTimer;
      _winner = value.getWinner;

      return (_start <= 0)
          ? Text('خسرت')
          : (_index == _winner)
              ? Winner()
              : Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            ContainerSection(
                              isQuestion: true,
                              body: levels.elementAt(_index)['question'],
                              correct: 'no',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            ContainerSection(
                              isQuestion: false,
                              index: 0,
                              body:
                                  levels.elementAt(_index)['answers'][0].answer,
                              correct: levels
                                  .elementAt(_index)['answers'][0]
                                  .correct,
                            ),
                            Container(
                              width: 20,
                            ),
                            ContainerSection(
                              isQuestion: false,
                              index: 1,
                              body:
                                  levels.elementAt(_index)['answers'][1].answer,
                              correct: levels
                                  .elementAt(_index)['answers'][1]
                                  .correct,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            ContainerSection(
                              isQuestion: false,
                              index: 2,
                              body:
                                  levels.elementAt(_index)['answers'][2].answer,
                              correct: levels
                                  .elementAt(_index)['answers'][2]
                                  .correct,
                            ),
                            Container(
                              width: 20,
                            ),
                            ContainerSection(
                              isQuestion: false,
                              index: 3,
                              body:
                                  levels.elementAt(_index)['answers'][3].answer,
                              correct: levels
                                  .elementAt(_index)['answers'][3]
                                  .correct,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.392,
                      top: MediaQuery.of(context).size.height * 0.142,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            shape: BoxShape.circle,
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "$_start",
                            style: TextStyle(
                              color: (_start > 10)
                                  ? Colors.white
                                  : Colors.red[500],
                              fontSize: _size,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
    });
  }
}
