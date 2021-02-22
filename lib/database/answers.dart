import 'package:who_will_win_million/database/database.dart';

class Answers {
  final int id;
  final String answer;
  final String correct;
  final String questionId;

  Answers({this.id, this.answer, this.correct, this.questionId});

  // Convert a Question into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': answer,
      'correct': correct,
      'questionId': questionId,
    };
  }

  Future<List<Answers>> answers() async {
    final db = await DBProvider.db.database;
    final List<Map<String, dynamic>> answers = await db.query('answers');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(answers.length, (i) {
      return Answers(
        id: answers[i]['id'],
        answer: answers[i]['answer'],
        correct: answers[i]['correct'],
        questionId: answers[i]['questionId'],
      );
    });
  }
}
