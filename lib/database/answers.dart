import 'package:who_will_win_million/database/database.dart';
import 'package:who_will_win_million/database/questions.dart';

class Answers {
  final int id;
  final String answer;
  final String correct;
  final int questionId;

  Answers({this.id, this.answer, this.correct, this.questionId});

  // Convert a Question into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'answer': answer,
      'correct': correct,
      'questionId': questionId,
    };
  }

  static Future<List<Answers>> answers() async {
    final db = await DBProvider.db.database;
    final List<Map<String, dynamic>> answers = await db.query('answers');

    // Convert the List<Map<String, dynamic> into a List<Answers>.
    return List.generate(answers.length, (i) {
      return Answers(
        id: answers[i]['id'],
        answer: answers[i]['answer'],
        correct: answers[i]['correct'],
        questionId: answers[i]['questionId'],
      );
    });
  }

  static Future<List<Answers>> getAnswersOfQuestion(int qId) async {
    final db = await DBProvider.db.database;
    final List<Map<String, dynamic>> answers =
        await db.rawQuery('select * from answers where questionId == $qId');

    // Convert the List<Map<String, dynamic> into a List<Answers>.
    return List.generate(answers.length, (i) {
      return Answers(
        id: answers[i]['id'],
        answer: answers[i]['answer'],
        correct: answers[i]['correct'],
        questionId: answers[i]['questionId'],
      );
    });
  }

  static Future<void> insertAnswer(Answers ans) async {
    final db = await DBProvider.db.database;
    int res = await db.insert('Answers', ans.toMap());
  }

  static Future<void> insertAllAnswers(List<Answers> allAnswers) async {
    for (var ans in allAnswers) {
      insertAnswer(ans);
    }
  }

  static Future<List<dynamic>> getGame() async {
    List<dynamic> results = List();
    List<Answers> ans;
    final List<Questions> questions = await Questions.questions();
    for (var q in questions) {
      ans = await getAnswersOfQuestion(q.id);
      var q1 = q.question;
      results.add({'question': q1, 'answers': ans});
    }
    return results;
  }
}
