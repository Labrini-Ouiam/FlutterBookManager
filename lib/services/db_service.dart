import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/book.dart';

class DBService {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    final path = join(await getDatabasesPath(), 'books.db');
    _database = await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id TEXT PRIMARY KEY, title TEXT, author TEXT)',
        );
      },
      version: 1,
    );
    return _database!;
  }

  static Future<void> insertItem(Book book) async {
    final db = await getDatabase();
    await db.insert('favorites', book.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

static Future<List<Book>> getItems() async {
  final db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('favorites');
  return List.generate(maps.length, (i) {
    return Book(
      id: maps[i]['id'] as String,
      title: maps[i]['title'] as String,
      author: maps[i]['author'] as String,
    );
  });
}


  static Future<void> deleteItem(String id) async {
    final db = await getDatabase();
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  static Future<bool> isFavorite(String id) async {
    final db = await getDatabase();
    final result = await db.query('favorites', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }
}
