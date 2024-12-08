import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data_model.dart';

class LocalDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB('Local.db');
    return _database!;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Localdata(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      Name TEXT NOT NULL,
      Age INTEGER NOT NULL,
      PhoneNumber TEXT NOT NULL
    )
  ''');
  }

  Future<int> addDataLocally(DataModel data) async {
    final db = await database;
    return await db.insert('Localdata', data.toMap());
  }

  Future<List<DataModel>> readAllData() async {
    final db = await database;
    final result = await db.query('Localdata');
    return result.map((e) => DataModel.fromMap(e)).toList();
  }

  Future<int> updateData(DataModel data) async {
    final db = await database;
    return await db.update('Localdata', data.toMap(), where: 'id = ?', whereArgs: [data.id]);
  }

  Future<int> deleteData(int id) async {
    final db = await database;
    return await db.delete('Localdata', where: 'id = ?', whereArgs: [id]);
  }
}
