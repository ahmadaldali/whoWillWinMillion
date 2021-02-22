import 'package:who_will_win_million/database/database.dart';

class Questions {
  final int id;
  final String question;
  final String qType;

  Questions({this.id, this.question, this.qType});

  // Convert a Question into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'qType': qType,
    };
  }

  Future<List<Questions>> questions() async {
    // Get a reference to the database.
    final db = await DBProvider.db.database;

    // Query the table for all The Questions.
    final List<Map<String, dynamic>> questions = await db.query('questions');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(questions.length, (i) {
      return Questions(
        id: questions[i]['id'],
        question: questions[i]['question'],
        qType: questions[i]['qType'],
      );
    });
  }

  Future<List<Questions>> getEasyQuestions() async {
    final db = await DBProvider.db.database;
    final List<Map<String, dynamic>> questions = await db.query(
      'questions',
      where: '$qType = normal',
    );

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(questions.length, (i) {
      return Questions(
        id: questions[i]['id'],
        question: questions[i]['question'],
        qType: questions[i]['qType'],
      );
    });
  }

  Future<List<Questions>> getNormalQuestions() async {
    final db = await DBProvider.db.database;
    final List<Map<String, dynamic>> questions = await db.rawQuery(
      'select * from questions where qType = normal',
    );

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(questions.length, (i) {
      return Questions(
        id: questions[i]['id'],
        question: questions[i]['question'],
        qType: questions[i]['qType'],
      );
    });
  }

  Future<List<Questions>> getDifficultQuestions() async {
    final db = await DBProvider.db.database;
    final List<Map<String, dynamic>> questions = await db.rawQuery(
      'select * from questions where qType = difficult',
    );

    // Convert the List<Map<String, dynamic> into a List<Question>.
    return List.generate(questions.length, (i) {
      return Questions(
        id: questions[i]['id'],
        question: questions[i]['question'],
        qType: questions[i]['qType'],
      );
    });
  }

  Future<int> insertQuestion(Questions question) async {
    final db = await DBProvider.db.database;
    int res = await db.insert('Questions', question.toMap());
    return res;
  }
}
