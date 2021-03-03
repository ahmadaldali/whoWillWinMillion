import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:who_will_win_million/home.dart';

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _name = '';
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  FocusNode _nameFocusNode = FocusNode();

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
      body: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: TextFormField(
                focusNode: _nameFocusNode,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "أدخل اسمك الثلاثي",
                  labelText: "الاسم الثلاثي",
                  alignLabelWithHint: false,
                  icon: Icon(Icons.person_outline),
                  filled: true,
                  //errorText: 'Null',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _name = value;
                },
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'الرجاء عدم ترك الاسم فارغاً';
                  }
                  if (value.length < 5) {
                    return 'الاسم المدخل قصير';
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            FlatButton(
              onPressed: () async {
                FocusScope.of(context).requestFocus(_nameFocusNode);
                if (_formKey.currentState.validate()) {
                  setState(() {
                    _autovalidate = false;
                  });
                  await _storeName(_name);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage();
                      },
                    ),
                  );
                } else {
                  setState(() {
                    _autovalidate = true;
                  });
                  return;
                }
              },
              child: Text(
                'ابدأ اللعب' + '       ',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF03416D),
                ),
                textAlign: TextAlign.center,
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
      ),
    );
  }
}
