import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:who_will_win_million/home.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  String name = '';

  _storeName(String na) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', na);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color(0xFF03416D),
        centerTitle: true,
        title: Text('من سيربح المليون'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "أدخل اسمك الثلاثي",
                labelText: "الاسم الثلاثي",
                alignLabelWithHint: false,
                icon: Icon(Icons.person_outline),
                filled: true,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                name = value;
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          FlatButton(
            onPressed: () async {
              await _storeName(name);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyHomePage();
                  },
                ),
              );
            },
            child: Text(
              '  ابدأ اللعب    ',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF03416D),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: Color(0xFF03416D),
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
