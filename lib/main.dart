import 'package:flutter/material.dart';
import 'package:who_will_win_million/components/container_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Stack(
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
                left: MediaQuery.of(context).size.width * 0.35,
                top: MediaQuery.of(context).size.height * 0.135,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.black),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      left: 20,
                    ),
                    child: Text(
                      '25',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
