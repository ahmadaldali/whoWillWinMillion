import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Winner extends StatefulWidget {
  bool winner;
  Winner(this.winner);
  @override
  _WinnerState createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  String name = '';
  String todayDate;
  bool loading = true;

  _getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    todayDate = DateFormat("yyyy/MM/dd").format(DateTime.now());
    _getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    name = 'لأمر ' + name.toString();
    name = name.trim();

    return Center(
        child: Container(
      decoration: BoxDecoration(
        //border: Border.all(),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.white70,
          Colors.yellow[300],
        ]),
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
        ),
        child: (!widget.winner)
            ? Center(
                child: Text(
                  'عذراً، لقد خسرت. جرب حظك مرة آخرى',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : loading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name.trim(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1000000 مبلغ',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'مليون ليرة سورية',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '2020/03/01',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
      ),
    ));
  }
}
