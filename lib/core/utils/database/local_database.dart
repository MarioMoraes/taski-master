import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._();
  static Database? _database;

  LocalDatabase._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todo_list.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            subtitle TEXT NOT NULL,
            isDone INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    final db = await database;
    return db.insert(table, values);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table, bool isDone) async {
    final db = await database;
    return db.query(table, where: 'isDone = ?', whereArgs: [isDone ? 1 : 0]);
  }

  Future<List<Map<String, dynamic>>> query(String table, String text) async {
    final db = await database;
    return db.query(table, where: 'title LIKE ?', whereArgs: ['%$text%']);
  }

  Future<int> update(String table, int id) async {
    final db = await database;
    return db.update(table, {'isDone': true}, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
