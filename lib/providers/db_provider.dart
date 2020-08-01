import 'dart:io';

import 'package:examen_movil/models/person_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  final tableName = "persons";

  DBProvider._() {}

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'prueba.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE $tableName"
        "(id INTEGER PRIMARY KEY,"
        "name text,"
        "image text,"
        "email text,"
        "street text,"
        "city text,"
        "state text,"
        "postcode text,"
        "phone text,"
        "rating real"
        ")",
      );
    });
  }

  newPerson(Person data) async {
    final db = await database;
    return await db.insert(tableName, data.toJson());
  }

  Future<int> total() async {
    final db = await database;
    final res = await db.rawQuery("SELECT count(*) total from $tableName");

    if (res.isEmpty) return 0;
    return res.first['total'];
  }

  Future<Person> getPersonId(int id) async {
    final db = await database;
    final res = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Person.fromDB(res.first) : null;
  }

  Future<List<Person>> getPeople() async {
    final db = await database;
    final res = await db.query(tableName);
    return res.isEmpty
        ? []
        : res.map((registro) => Person.fromDB(registro)).toList();
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete("DELETE from $tableName");
    return res;
  }
}
