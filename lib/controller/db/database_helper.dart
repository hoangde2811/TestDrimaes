import 'dart:io';


import 'package:drimaes/model/thongtin.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'thongtin';
  static final columnId = 'id';
  static final columnFirstName = 'first_name';
  static final columnLastName = 'last_name';
  static final columnEmail = 'email';
  static final columnAvatar = 'avatar';
  static final columnPage = 'page';
  static final columnTotalPage = 'total_page';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _database;
  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnFirstName TEXT,
            $columnLastName TEXT,
            $columnEmail TEXT,
            $columnAvatar TEXT,
            $columnPage INTEGER NOT NULL,
            $columnTotalPage INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(ThongTin user) async {
    Database db = await instance.database;

    return await db.insert(table, user.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> update(ThongTin thongtin) async {
    Database db = await instance.database;

    return await db.update(table, thongtin.toMap(),
        where: "id = ?", whereArgs: [thongtin.id]);
  }

  Future<List<ThongTin>> queryAllUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users = await db.query(table);
    return users.map((u) => ThongTin.fromMap(u)).toList();
  }

  Future<List<Map<String, dynamic>> > querySQL(String key,int value) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users = await db.query(table,where:"$key =?",whereArgs: [value] );
    // List<Map<String, dynamic>> users = await db.rawQuery("SELECT * FROM $table WHERE $key=$value");
    return users;
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}
