import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    });
  }
}
