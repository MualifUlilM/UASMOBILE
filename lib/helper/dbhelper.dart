import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:uas/model/data.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _database;
  static DBHelper _dbHelper;
  DBHelper._createObject();

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'database.db';
    print(path);
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    print("DATABASE CREATED");
    return todoDatabase;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE data (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT, age INTEGER, hobby TEXT, image_path TEXT
      )
      ''');
  }

  Future<Database> get database async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('data', orderBy: 'id');
    print(mapList);
    return mapList;
  }

  Future<int> insert(Data data) async {
    Database db = await this.database;
    int count = await db.insert('data', data.toMap());
    return count;
  }

  Future<int> update(Data data) async {
    Database db = await this.database;
    int count = await db
        .update('data', data.toMap(), where: 'id=?', whereArgs: [data.id]);
    print(count);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('data', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Data>> getDataList() async {
    var dataMapList = await select();
    List<Data> dataList = List<Data>();
    for (var item in dataMapList) {
      dataList.add(Data.fromJson(item));
    }
    return dataList;
  }
}
