import 'dart:async';
import 'package:flutter/material.dart';
import 'package:who_will_win_million/components/container_section.dart';
import 'package:who_will_win_million/components/help.dart';
import 'package:who_will_win_million/components/money_text.dart';
import 'package:who_will_win_million/database/questions.dart';

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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
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
                    child: Text(
                      'SY ' + '64,000',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                      onPressed: () async {
                        List<Questions> re = [];
                        re.add(Questions(
                            id: 8,
                            qType: 'easy',
                            question: 'من هو مكتشف جدول الضرب'));

                        re.add(Questions(
                            id: 9,
                            qType: 'easy',
                            question: 'كم عدد الدول العربية'));

                        re.add(Questions(
                            id: 10,
                            qType: 'easy',
                            question: 'ما هي أصغر قارات العالم مساحة'));

                        re.add(Questions(
                            id: 11,
                            qType: 'easy',
                            question:
                                'ما هي الدولة العربية التي يمر بها خط الاستواء'));

                        re.add(Questions(
                            id: 12,
                            qType: 'easy',
                            question:
                                'ما هي الدولة التي تتكون من مجموعة من الجزر تشبه الهلال'));

                        re.add(Questions(
                            id: 13,
                            qType: 'easy',
                            question: 'ما هي عاصمة سوريا'));

                        re.add(Questions(
                            id: 14,
                            qType: 'easy',
                            question: 'ما هي عاصمة لبنان'));

                        re.add(Questions(
                            id: 15,
                            qType: 'easy',
                            question: 'ما هي عاصمة السعودية'));

                        re.add(Questions(
                            id: 16,
                            qType: 'easy',
                            question: 'ما هي عاصمة اسبانيا'));

                        re.add(Questions(
                            id: 17,
                            qType: 'easy',
                            question: 'ما هي عاصمة ايطاليا'));

                        re.add(Questions(
                            id: 18,
                            qType: 'easy',
                            question: 'ما هي عاصمة الامارات'));

                        re.add(Questions(
                            id: 19,
                            qType: 'easy',
                            question: 'ما هي عاصمة انكلترا'));

                        re.add(Questions(
                            id: 20,
                            qType: 'easy',
                            question: 'ما هي عاصمة مصر'));

                        re.add(Questions(
                            id: 21,
                            qType: 'easy',
                            question: 'ما هي عاصمة البرازيل'));

                        re.add(Questions(
                            id: 22,
                            qType: 'easy',
                            question: 'ما هي عاصمة المكسيك'));

                        re.add(Questions(
                            id: 23,
                            qType: 'easy',
                            question: 'ما هي عاصمة السويد'));

                        re.add(Questions(
                            id: 24,
                            qType: 'easy',
                            question: 'ما هي عاصمة سويسرا'));

                        re.add(Questions(
                            id: 25,
                            qType: 'easy',
                            question: 'ما هي عاصمة غانا'));

                        re.add(Questions(
                            id: 26,
                            qType: 'easy',
                            question: 'ما هي عاصمة اليابان'));

                        re.add(Questions(
                            id: 27,
                            qType: 'easy',
                            question: 'ما هي عاصمة الصين'));

                        re.add(Questions(
                            id: 28,
                            qType: 'easy',
                            question: 'ما هي أكثر الدول سكانا في العالم'));

                        re.add(Questions(
                            id: 29,
                            qType: 'easy',
                            question: 'ما هي أكبر مدينة في آسيا'));

                        re.add(Questions(
                            id: 30,
                            qType: 'easy',
                            question: 'ما هو لون الرئتين السليمتين'));

                        re.add(Questions(
                            id: 31,
                            qType: 'easy',
                            question: 'ما هو أقرب كوكب إلى الشمس'));

                        re.add(Questions(
                            id: 32,
                            qType: 'easy',
                            question: 'ما هو الحيوان الذي يُسمى البهنس'));

                        re.add(Questions(
                            id: 33,
                            qType: 'easy',
                            question: 'ما هو مقياس سرعة السفن'));

                        re.add(Questions(
                            id: 34,
                            qType: 'easy',
                            question:
                                'ما هو الغاز الذي يستعمل في إطفاء الحرائق'));

                        re.add(Questions(
                            id: 35,
                            qType: 'easy',
                            question:
                                'ما هو الحيوان الذي يصاب بالحصبة كالإنسان'));

                        re.add(Questions(
                            id: 36,
                            qType: 'easy',
                            question:
                                'ما هو البحر الذي يفصل بين تركيا واليونان'));

                        re.add(Questions(
                            id: 37, qType: 'easy', question: 'ما هو الفيفا'));

                        re.add(Questions(
                            id: 38,
                            qType: 'easy',
                            question: 'كم عدد الثقوب في لعبة البلياردو'));

                        re.add(Questions(
                            id: 39,
                            qType: 'easy',
                            question: 'ما سبب مرض الكوليرا'));

                        re.add(Questions(
                            id: 40,
                            qType: 'easy',
                            question:
                                'ما النسبة المئوية التي تحملها النطفة من صفات الأب'));

                        re.add(Questions(
                            id: 41,
                            qType: 'easy',
                            question: 'ماذا يحدث بحجم الماء عن التجمد'));

                        re.add(Questions(
                            id: 42,
                            qType: 'easy',
                            question: 'من أي مادة تصنع عجلات السيارات'));

                        re.add(Questions(
                            id: 43,
                            qType: 'easy',
                            question: 'أين توجد البلازما'));

                        re.add(Questions(
                            id: 44,
                            qType: 'easy',
                            question:
                                'كيف يخرج الجنين مخلفاته وهو في بطن أمه'));

                        re.add(Questions(
                            id: 45,
                            qType: 'easy',
                            question:
                                'ما الفيتامين الذي يأخذه الجسم من أشعة الشمس'));

                        re.add(Questions(
                            id: 46,
                            qType: 'easy',
                            question:
                                'ما فصيلة الدم التي يطلق عليها فصيلة الدم الكريمة'));

                        re.add(Questions(
                            id: 47,
                            qType: 'easy',
                            question:
                                'ما الشيء الذي تستطيع أن تفعله دون أن يراه أحد'));

                        re.add(Questions(
                            id: 48,
                            qType: 'easy',
                            question:
                                'ما الشيء الذي لا يتحرك الا اذا ضربته على رأسه'));

                        re.add(Questions(
                            id: 49,
                            qType: 'easy',
                            question:
                                'أيهما أثقل، طن من الحديد أم طن من الريش'));

                        re.add(Questions(
                            id: 50,
                            qType: 'easy',
                            question: 'متى نستطيع وضع الماء في الغربال'));
                        print(re.length);
                        //Questions.insertAllQuestions(re);
                        print('object');
                        //print( Questions.questions().then((value) => null))
                      },
                      child: null)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
