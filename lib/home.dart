import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/components/all_helps.dart';
import 'package:who_will_win_million/components/basic.dart';
import 'package:who_will_win_million/components/money_column.dart';
import 'package:who_will_win_million/components/value.dart';
import 'package:who_will_win_million/database/answers.dart';
import 'package:who_will_win_million/provider_class.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _levels;
  double _size;

  @override
  void initState() {
    _levels = null;
    initLevels();
    super.initState();
  }

  void initLevels() async {
    _levels = await Answers.getGame();
    setState(() {});
    await Future.delayed(new Duration(seconds: 1));
    Provider.of<ProviderClass>(context, listen: false).decreaseTimer();
  }

  @override
  Widget build(BuildContext context) {
    _size = (MediaQuery.of(context).size.height < 700) ? 17 : 20;
    _size = (MediaQuery.of(context).size.width < 400) ? 15 : _size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Color(0xFF03416D),
        centerTitle: true,
        title: Text('من سيربح المليون'),
      ),
      body: _levels == null
          ? Center(
              child: SpinKitWave(
                color: Color(0xFF03416D),
                type: SpinKitWaveType.center,
              ),
            )
          : Center(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MoneyColumn(),
                    AllHelps(),
                    Basic(_levels),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ValueOfGame(),
                  ],
                ),
              ),
            ),
    );
  }
}
