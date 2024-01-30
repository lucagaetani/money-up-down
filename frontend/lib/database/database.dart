import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    //deleteDatabase(join(await getDatabasesPath(), 'userExpenses.db'));
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'userExpenses.db'), version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Expenses (
        id INTEGER,
        amount FLOAT NOT NULL,
        category TEXT NOT NULL,
        description TEXT,
        add_or_remove INT NOT NULL,
        date TEXT NOT NULL,
        created_at TEXT NOT NULL,
        PRIMARY KEY("id" AUTOINCREMENT)
      )
    ''');
  }

  Future<void> deleteDatabase(String path) =>
    databaseFactory.deleteDatabase(path);

  Future<List<Map<String, dynamic>>> getRows(String date) async {
    Database db = await instance.database;
    return await db.query('Expenses', where: 'date = ?', whereArgs: [date], groupBy: 'category', orderBy: 'amount');
  }

  Future<List<Map<String, dynamic>>> getTotalSum() async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT ROUND(SUM(CASE WHEN add_or_remove=0 THEN amount WHEN add_or_remove=1 THEN -amount END),2) as Total FROM Expenses");
  }

  Future<void> deleteRow(int id) async {
    final db = await instance.database;
    await db.delete(
      'Expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertRow(Map<String, dynamic> expense) async {
    final db = await instance.database;
    await db.insert(
      'Expenses',
      expense
    );
  }
}