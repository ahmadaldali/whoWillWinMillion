import 'package:flutter/material.dart';
import 'package:who_will_win_million/components/container_section.dart';

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
                left: MediaQuery.of(context).size.width * 0.37,
                top: MediaQuery.of(context).size.height * 0.16,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      's',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
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
