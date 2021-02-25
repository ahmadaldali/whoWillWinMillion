import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:who_will_win_million/database/answers.dart';
import 'package:who_will_win_million/database/questions.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

//Singelton
  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "million.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Questions ("
          "id INTEGER PRIMARY KEY,"
          "question TEXT,"
          "qType TEXT"
          ")");

      await db.execute("CREATE TABLE Answers ("
          "id INTEGER PRIMARY KEY,"
          "answer TEXT,"
          "correct TEXT,"
          "questionId INTEGER,"
          "FOREIGN KEY (questionId) REFERENCES Questions (id)"
          ")");

      //add questions
      List<Questions> re = [];
      re.add(
          Questions(id: 1, qType: 'easy', question: 'ما هو عدد أيام الأسبوع'));

      re.add(Questions(
          id: 2,
          qType: 'easy',
          question: 'أي من التالي ليس من عدد أيام الشهر'));

      re.add(
          Questions(id: 3, qType: 'easy', question: 'ما هو عدد ساعات اليوم'));

      re.add(Questions(
          id: 4,
          qType: 'easy',
          question: 'اذا أكرمت الكريم ملكته، واذا اكرمت اللئيم'));

      re.add(Questions(
          id: 5, qType: 'easy', question: 'ماذا يدعى مكان سكن النحل'));

      re.add(Questions(id: 6, qType: 'easy', question: 'ما هو عدد أشهر السنة'));

      re.add(Questions(
          id: 7, qType: 'easy', question: 'عصفور بالايد أحسن من عشرة ع'));

      re.add(
          Questions(id: 8, qType: 'easy', question: 'من هو مكتشف جدول الضرب'));

      re.add(Questions(id: 9, qType: 'easy', question: 'كم عدد الدول العربية'));

      re.add(Questions(
          id: 10, qType: 'easy', question: 'ما هي أصغر قارات العالم مساحة'));

      re.add(Questions(
          id: 11,
          qType: 'easy',
          question: 'ما هي الدولة العربية التي يمر بها خط الاستواء'));

      re.add(Questions(
          id: 12,
          qType: 'easy',
          question: 'ما هي الدولة التي تتكون من مجموعة من الجزر تشبه الهلال'));

      re.add(Questions(id: 13, qType: 'easy', question: 'ما هي عاصمة سوريا'));

      re.add(Questions(id: 14, qType: 'easy', question: 'ما هي عاصمة لبنان'));

      re.add(
          Questions(id: 15, qType: 'easy', question: 'ما هي عاصمة السعودية'));

      re.add(Questions(id: 16, qType: 'easy', question: 'ما هي عاصمة اسبانيا'));

      re.add(Questions(id: 17, qType: 'easy', question: 'ما هي عاصمة ايطاليا'));

      re.add(
          Questions(id: 18, qType: 'easy', question: 'ما هي عاصمة الامارات'));

      re.add(Questions(id: 19, qType: 'easy', question: 'ما هي عاصمة انكلترا'));

      re.add(Questions(id: 20, qType: 'easy', question: 'ما هي عاصمة مصر'));

      re.add(
          Questions(id: 21, qType: 'easy', question: 'ما هي عاصمة البرازيل'));

      re.add(Questions(id: 22, qType: 'easy', question: 'ما هي عاصمة المكسيك'));

      re.add(Questions(id: 23, qType: 'easy', question: 'ما هي عاصمة السويد'));

      re.add(Questions(id: 24, qType: 'easy', question: 'ما هي عاصمة سويسرا'));

      re.add(Questions(id: 25, qType: 'easy', question: 'ما هي عاصمة غانا'));

      re.add(Questions(id: 26, qType: 'easy', question: 'ما هي عاصمة اليابان'));

      re.add(Questions(id: 27, qType: 'easy', question: 'ما هي عاصمة الصين'));

      re.add(Questions(
          id: 28, qType: 'easy', question: 'ما هي أكثر الدول سكانا في العالم'));

      re.add(Questions(
          id: 29, qType: 'easy', question: 'ما هي أكبر مدينة في آسيا'));

      re.add(Questions(
          id: 30, qType: 'easy', question: 'ما هو لون الرئتين السليمتين'));

      re.add(Questions(
          id: 31, qType: 'easy', question: 'ما هو أقرب كوكب إلى الشمس'));

      re.add(Questions(
          id: 32, qType: 'easy', question: 'ما هو الحيوان الذي يُسمى البهنس'));

      re.add(
          Questions(id: 33, qType: 'easy', question: 'ما هو مقياس سرعة السفن'));

      re.add(Questions(
          id: 34,
          qType: 'easy',
          question: 'ما هو الغاز الذي يستعمل في إطفاء الحرائق'));

      re.add(Questions(
          id: 35,
          qType: 'easy',
          question: 'ما هو الحيوان الذي يصاب بالحصبة كالإنسان'));

      re.add(Questions(
          id: 36,
          qType: 'easy',
          question: 'ما هو البحر الذي يفصل بين تركيا واليونان'));

      re.add(Questions(id: 37, qType: 'easy', question: 'ما هو الفيفا'));

      re.add(Questions(
          id: 38, qType: 'easy', question: 'كم عدد الثقوب في لعبة البلياردو'));

      re.add(Questions(id: 39, qType: 'easy', question: 'ما سبب مرض الكوليرا'));

      re.add(Questions(
          id: 40,
          qType: 'easy',
          question: 'ما النسبة المئوية التي تحملها النطفة من صفات الأب'));

      re.add(Questions(
          id: 41, qType: 'easy', question: 'ماذا يحدث بحجم الماء عن التجمد'));

      re.add(Questions(
          id: 42, qType: 'easy', question: 'من أي مادة تصنع عجلات السيارات'));

      re.add(Questions(id: 43, qType: 'easy', question: 'أين توجد البلازما'));

      re.add(Questions(
          id: 44,
          qType: 'easy',
          question: 'كيف يخرج الجنين مخلفاته وهو في بطن أمه'));

      re.add(Questions(
          id: 45,
          qType: 'easy',
          question: 'ما الفيتامين الذي يأخذه الجسم من أشعة الشمس'));

      re.add(Questions(
          id: 46,
          qType: 'easy',
          question: 'ما فصيلة الدم التي يطلق عليها فصيلة الدم الكريمة'));

      re.add(Questions(
          id: 47,
          qType: 'easy',
          question: 'ما الشيء الذي تستطيع أن تفعله دون أن يراه أحد'));

      re.add(Questions(
          id: 48,
          qType: 'easy',
          question: 'ما الشيء الذي لا يتحرك الا اذا ضربته على رأسه'));

      re.add(Questions(
          id: 49,
          qType: 'easy',
          question: 'أيهما أثقل، طن من الحديد أم طن من الريش'));

      re.add(Questions(
          id: 50, qType: 'easy', question: 'متى نستطيع وضع الماء في الغربال'));
      Questions.insertAllQuestions(re);

      //answers
      List<Answers> ans = [];

      ans.add(Answers(id: 1, correct: 'no', questionId: 1, answer: '5'));
      ans.add(Answers(id: 2, correct: 'no', questionId: 1, answer: '6'));
      ans.add(Answers(id: 3, correct: 'yes', questionId: 1, answer: '7'));
      ans.add(Answers(id: 4, correct: 'no', questionId: 1, answer: '8'));

      ans.add(Answers(id: 5, correct: 'no', questionId: 2, answer: '29'));
      ans.add(Answers(id: 6, correct: 'no', questionId: 2, answer: '30'));
      ans.add(Answers(id: 7, correct: 'no', questionId: 2, answer: '31'));
      ans.add(Answers(id: 8, correct: 'yes', questionId: 2, answer: '32'));

      ans.add(Answers(id: 9, correct: 'no', questionId: 3, answer: '12'));
      ans.add(Answers(id: 10, correct: 'yes', questionId: 3, answer: '24'));
      ans.add(Answers(id: 11, correct: 'no', questionId: 3, answer: '31'));
      ans.add(Answers(id: 12, correct: 'no', questionId: 3, answer: '25'));

      ans.add(Answers(id: 13, correct: 'no', questionId: 4, answer: 'ملكته'));
      ans.add(Answers(id: 14, correct: 'no', questionId: 4, answer: 'لئمته'));
      ans.add(Answers(id: 15, correct: 'no', questionId: 4, answer: 'صنعته'));
      ans.add(Answers(id: 16, correct: 'yes', questionId: 4, answer: 'تمردا'));

      ans.add(Answers(id: 17, correct: 'yes', questionId: 5, answer: 'خلية'));
      ans.add(Answers(id: 18, correct: 'no', questionId: 5, answer: 'بيت'));
      ans.add(Answers(id: 19, correct: 'no', questionId: 5, answer: 'منزل'));
      ans.add(Answers(id: 20, correct: 'no', questionId: 5, answer: 'مسكن'));

      ans.add(Answers(id: 21, correct: 'yes', questionId: 6, answer: '12'));
      ans.add(Answers(id: 22, correct: 'no', questionId: 6, answer: '11'));
      ans.add(Answers(id: 23, correct: 'no', questionId: 6, answer: '10'));
      ans.add(Answers(id: 24, correct: 'no', questionId: 6, answer: '13'));

      ans.add(Answers(id: 25, correct: 'no', questionId: 7, answer: 'الدرج'));
      ans.add(Answers(id: 26, correct: 'no', questionId: 7, answer: 'العش'));
      ans.add(Answers(id: 27, correct: 'yes', questionId: 7, answer: 'الشجرة'));
      ans.add(Answers(id: 28, correct: 'no', questionId: 7, answer: 'السطح'));

      ans.add(
          Answers(id: 29, correct: 'no', questionId: 8, answer: 'الخوارزمي'));
      ans.add(
          Answers(id: 30, correct: 'no', questionId: 8, answer: 'ابن سينا'));
      ans.add(
          Answers(id: 31, correct: 'no', questionId: 8, answer: 'ليونيل ميسي'));
      ans.add(
          Answers(id: 32, correct: 'yes', questionId: 8, answer: 'فيثاغورث'));

      ans.add(Answers(id: 33, correct: 'no', questionId: 9, answer: '21'));
      ans.add(Answers(id: 34, correct: 'yes', questionId: 9, answer: '22'));
      ans.add(Answers(id: 35, correct: 'no', questionId: 9, answer: '23'));
      ans.add(Answers(id: 36, correct: 'no', questionId: 9, answer: '24'));

      ans.add(
          Answers(id: 37, correct: 'yes', questionId: 10, answer: 'استراليا'));
      ans.add(Answers(id: 38, correct: 'no', questionId: 10, answer: 'اسيا'));
      ans.add(Answers(id: 39, correct: 'no', questionId: 10, answer: 'اوروبا'));
      ans.add(
          Answers(id: 40, correct: 'no', questionId: 10, answer: 'افريقيا'));

      ans.add(Answers(id: 41, correct: 'no', questionId: 11, answer: 'سوريا'));
      ans.add(Answers(id: 42, correct: 'no', questionId: 11, answer: 'لبنان'));
      ans.add(
          Answers(id: 43, correct: 'yes', questionId: 11, answer: 'الصومال'));
      ans.add(
          Answers(id: 44, correct: 'no', questionId: 11, answer: 'السعودية'));

      ans.add(Answers(id: 45, correct: 'no', questionId: 12, answer: 'سوريا'));
      ans.add(Answers(
          id: 46, correct: 'no', questionId: 12, answer: 'جزر الكناري'));
      ans.add(
          Answers(id: 47, correct: 'no', questionId: 12, answer: 'الصومال'));
      ans.add(
          Answers(id: 48, correct: 'yes', questionId: 12, answer: 'جزر القمر'));

      ans.add(Answers(id: 49, correct: 'no', questionId: 13, answer: 'حمص'));
      ans.add(Answers(id: 50, correct: 'yes', questionId: 13, answer: 'دمشق'));
      ans.add(Answers(id: 51, correct: 'no', questionId: 13, answer: 'حلب'));
      ans.add(
          Answers(id: 52, correct: 'no', questionId: 13, answer: 'اللاذقية'));

      ans.add(Answers(id: 53, correct: 'no', questionId: 14, answer: 'صور'));
      ans.add(Answers(id: 54, correct: 'no', questionId: 14, answer: 'صيدا'));
      ans.add(Answers(id: 55, correct: 'no', questionId: 14, answer: 'طرابلس'));
      ans.add(Answers(id: 56, correct: 'yes', questionId: 14, answer: 'بيروت'));

      ans.add(
          Answers(id: 57, correct: 'yes', questionId: 15, answer: 'الرياض'));
      ans.add(Answers(
          id: 58, correct: 'no', questionId: 15, answer: 'مكة المكرمة'));
      ans.add(Answers(id: 59, correct: 'no', questionId: 15, answer: 'جدة'));
      ans.add(Answers(id: 60, correct: 'no', questionId: 15, answer: 'الطائف'));

      ans.add(Answers(id: 61, correct: 'yes', questionId: 16, answer: 'مدريد'));
      ans.add(
          Answers(id: 62, correct: 'no', questionId: 16, answer: 'برشلونة'));
      ans.add(Answers(id: 63, correct: 'no', questionId: 16, answer: 'خيتافي'));
      ans.add(Answers(id: 64, correct: 'no', questionId: 16, answer: 'ملقا'));

      ans.add(Answers(id: 65, correct: 'no', questionId: 17, answer: 'ميلانو'));
      ans.add(Answers(id: 66, correct: 'no', questionId: 17, answer: 'تورينو'));
      ans.add(Answers(id: 67, correct: 'yes', questionId: 17, answer: 'روما'));
      ans.add(Answers(id: 68, correct: 'no', questionId: 17, answer: 'نابولي'));

      ans.add(Answers(id: 69, correct: 'no', questionId: 18, answer: 'العين'));
      ans.add(
          Answers(id: 70, correct: 'no', questionId: 18, answer: 'الشارقة'));
      ans.add(Answers(id: 71, correct: 'no', questionId: 18, answer: 'دبي'));
      ans.add(
          Answers(id: 72, correct: 'yes', questionId: 18, answer: 'أبو ظبي'));

      ans.add(
          Answers(id: 73, correct: 'no', questionId: 19, answer: 'ويستهام'));
      ans.add(Answers(id: 74, correct: 'yes', questionId: 19, answer: 'لندن'));
      ans.add(
          Answers(id: 75, correct: 'no', questionId: 19, answer: 'ليفربول'));
      ans.add(
          Answers(id: 76, correct: 'no', questionId: 19, answer: 'مانشستر'));

      ans.add(
          Answers(id: 77, correct: 'yes', questionId: 20, answer: 'القاهرة'));
      ans.add(
          Answers(id: 78, correct: 'no', questionId: 20, answer: 'الاسكندرية'));
      ans.add(Answers(id: 79, correct: 'no', questionId: 20, answer: 'اسوان'));
      ans.add(Answers(id: 80, correct: 'no', questionId: 20, answer: 'طنطا'));

      Answers.insertAllAnswers(ans);
    });
  }
}
